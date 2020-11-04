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
    func startSignInWithAppleFlow(onSignedIn: @escaping () -> Void) {
        
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
        
//        // Check provider ID to verify that the user has signed in with Apple
//        if let providerId = Auth.auth().currentUser?.providerData.first?.providerID,
//            providerId == "apple.com" {
//            // Clear saved user ID
//            UserDefaults.standard.set(nil, forKey: "appleAuthorizedUserIdKey")
//        }
        
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
            
            // Create an account in your system.
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            
            // For the purpose of this demo app, store the `userIdentifier` in the keychain.
            //self.saveUserInKeychain(userIdentifier)
            
                        
            // Initialize a Firebase credential.
            let firebaseCredential = OAuthProvider.credential(withProviderID: "apple.com",
                                                      idToken: idTokenString,
                                                      rawNonce: nonce)
            
            
            // Sign in with Firebase.
            Auth.auth().signIn(with: firebaseCredential) { (authResult, error) in
                if let user = authResult?.user {
                    if let callback = self.onSignedIn {
                        callback()
                    }
                }

                if error != nil {
                    print("Error signing in: \(error?.localizedDescription)")
                }
                else {
                    
//                    // Mak a request to set user's display name on Firebase
//                    let changeRequest = authResult?.user.createProfileChangeRequest()
//                    changeRequest?.displayName = appleIDCredential.fullName?.givenName
//                    changeRequest?.commitChanges(completion: { (error) in
//
//                        if let error = error {
//                            print(error.localizedDescription)
//                        } else {
//                            print("Updated display name: \(Auth.auth().currentUser!.displayName!)")
//                        }
//                    })
                    
                    
                    DispatchQueue.main.async {
                        self.isUserAuthenticated = .signedIn
                    }
              
                    if let callback = self.onSignedIn {
                        callback()
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

