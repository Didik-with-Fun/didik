//
//  SignInWithAppleCoordinator.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/3/20.
//

import Foundation
import AuthenticationServices
import Firebase

class SignInWithAppleCoordinator: NSObject, ObservableObject, ASAuthorizationControllerPresentationContextProviding {
    
    private var onSignedIn: (() -> Void)?
    
    @Published var isUserAuthenticated: AuthState = AuthState.undefined
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return UIApplication.shared.windows.first!
    }
  
    // Unhashed nonce.
    fileprivate var currentNonce: String?
    
    @available(iOS 13, *)
    func startSignInWithAppleFlow() { //(onSignedIn: @escaping () -> Void) {
        
        let nonce = AuthenticationUtil.randomNonceString()
        currentNonce = nonce
        let appleIDProvider = ASAuthorizationAppleIDProvider()
       
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = AuthenticationUtil.sha256(nonce)
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    func signOut() throws {
        
        // Perform sign out from Firebase
        try Auth.auth().signOut()
        isUserAuthenticated = AuthState.signedOut
    }

}


@available(iOS 13.0, *)
extension SignInWithAppleCoordinator: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            
            guard let nonce = currentNonce else {
                fatalError("Invalid state: A login callback was received, but no login request was sent.")
            }
            guard let appleIDToken = appleIDCredential.identityToken else {
                print("Unable to fetch identity token")
                return
            }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                return
            }
            
                        
            // Initialize a Firebase credential.
            let firebaseCredential = OAuthProvider.credential(withProviderID: "apple.com",
                                                      idToken: idTokenString,
                                                      rawNonce: nonce)
            
            
            // Sign in with Firebase.
            Auth.auth().signIn(with: firebaseCredential) { (authResult, error) in
  
                if error != nil {
                    print("Error signing in (FIREBASE): \(error?.localizedDescription ?? "")")
                }
                else {
                
                    self.isUserAuthenticated = .signedIn
                    
                    let userIdentifier = appleIDCredential.user
                    let fullName = (appleIDCredential.fullName?.givenName ?? "") + " " + (appleIDCredential.fullName?.familyName ?? "")
                    let email = appleIDCredential.email
                    
                    if (fullName.trimmingCharacters(in: .whitespacesAndNewlines) != "" && email != nil) {
                        self.setUserInfo(for: userIdentifier, fullname: fullName, email: email)
                    }

                }
            }
                   
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
        print("Sign in with Apple errored: \(error)")
    }
    
}

extension SignInWithAppleCoordinator {
    private func setUserInfo(for userId: String, fullname: String?, email: String?) {
        
        ASAuthorizationAppleIDProvider().getCredentialState(forUserID: userId, completion: { (credentialState, error) in
            
            var authState: String?
            
            switch credentialState {
                
            case .authorized:
                authState = "authorized"
            case .revoked:
                authState = "revoked"
            case .notFound:
                authState = "notFound"
            case .transferred:
                authState = "transferred"
            @unknown default:
                fatalError()
            }
            
            let userData = UserData(appleIdentifier: userId, fullName: fullname ?? "", email: email ?? "")
            
            if let userDataEncoded = try? JSONEncoder().encode(userData) {
                UserDefaults.standard.set(userDataEncoded, forKey: "userData")
            }
            
        })
            
        
    }
}

