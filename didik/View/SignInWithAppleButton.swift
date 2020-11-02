//
//  test.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/3/20.
//

import SwiftUI
import AuthenticationServices


struct SignInWithAppleButton: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct SignInWithAppleButton_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithAppleButton()
    }
}
