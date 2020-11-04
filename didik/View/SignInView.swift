//
//  SignInView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/3/20.
//

import SwiftUI
import AuthenticationServices

struct SignInView: View {
    
    @EnvironmentObject var signInCoordinator: SignInWithAppleCoordinator
    
    var body: some View {
        ZStack {
            
            Rectangle().fill(Color("GreyBackground"))
                .frame(width: 679, height: 884, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(30)
            
            VStack {
                Image("Icon").resizable()
                    .frame(width: 176, height: 120, alignment: .leading)
                    .padding(.bottom, 100)//.offset(x: 0, y: -200)
                
                SignInWithAppleButton()
                    .frame(width: 280, height: 60)
                    .onTapGesture(perform: {
                        self.signInCoordinator.startSignInWithAppleFlow {}
                    })
            }
            
        }
    }
    
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
        SignInView()
            .preferredColorScheme(.dark)
        SignInView().previewLayout(.fixed(width: 1024, height: 768))
    }
}
