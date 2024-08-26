//
//  RegisterViewModel.swift
//  MVVMFirstProject
//
//  Created by Pedro Botega on 21/08/24.
//

import UIKit
import FirebaseAuth
import Firebase

protocol RegisterViewModelProtocol: AnyObject {
    func successRegister()
    func errorRegister(errorMessage: String)
}

class RegisterViewModel {
    private var auth = Auth.auth()
    private weak var delegate: RegisterViewModelProtocol?
    
    public func delegate(delegate: RegisterViewModelProtocol?) {
        self.delegate = delegate
    }
    
    // Método para registro de novo usuário
    public func registerUser(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                print("Sucesso no cadastro")
                self.delegate?.successRegister()
            } else {
                print("Erro no cadastro, erro: \(error?.localizedDescription ?? "")")
                self.delegate?.errorRegister(errorMessage: error?.localizedDescription ?? "")
            }
        }
    }
}

