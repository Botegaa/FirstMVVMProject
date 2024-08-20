//
//  LoginViewModal.swift
//  MVVMFirstProject
//
//  Created by Pedro Botega on 15/08/24.
//

import UIKit
import FirebaseAuth
import Firebase

protocol LoginViewModelProtocol : AnyObject {
    	func sucessLogin()
        func errorLogin(errorMessage: String )
}

class LoginViewModal {
    private var auth = Auth.auth()
    private weak var delegate:LoginViewModelProtocol?
    
    public func delegate(delegate:LoginViewModelProtocol?){
        self.delegate = delegate
        
    }
    
    // Método para login
    public func login(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if error == nil {
                print("Sucesso no login")
                self.delegate?.sucessLogin()
               
            } else {
                print("Erro no login, erro: \(error?.localizedDescription ?? "")")
                self.delegate?.errorLogin(errorMessage: error?.localizedDescription ?? "")
            }
        }
    }
    
    // Método para registro de novo usuário
    public func registerUser(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                print("Sucesso no cadastro")
            } else {
                print("Erro no cadastro, erro: \(error?.localizedDescription ?? "")")
            }
        }
    }
}
