//
//  RegisterViewController.swift
//  MVVMFirstProject
//
//  Created by Pedro Botega on 21/08/24.
//

import UIKit

class RegisterVC: UIViewController {
   
    private var registerScreen: RegisterScreen?
    private var viewModel: RegisterViewModel = RegisterViewModel()
    
    override func loadView() {
        registerScreen = RegisterScreen()
        view = registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.delegate(delegate: self)
        registerScreen?.configTextFieldDelegate(delegate: self)
        viewModel.delegate(delegate: self)
    }
}

extension RegisterVC: RegisterViewModelProtocol {
    func successRegister() {
        let vc: LoginVC = LoginVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func errorRegister(errorMessage: String) {
        Alert(controller: self).showAlertInformation(title: "Ops, erro no registro!", message: errorMessage)
    }
}

extension RegisterVC: RegisterScreenProtocol {
    func tappedRegisterButton() {
        viewModel.registerUser(email: registerScreen?.emailTextField.text ?? "", password: registerScreen?.passwordTextField.text ?? "")
    }
}

extension RegisterVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Código opcional para início da edição do texto
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let email: String = registerScreen?.emailTextField.text ?? ""
        let password : String = registerScreen?.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            registerScreen?.registerButton.isEnabled = true
            registerScreen?.registerButton.backgroundColor = .darkGray
        } else {
            registerScreen?.registerButton.backgroundColor = .darkGray.withAlphaComponent(0.6)
            registerScreen?.registerButton.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

