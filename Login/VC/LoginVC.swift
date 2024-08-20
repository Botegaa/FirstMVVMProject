//
//  ViewController.swift
//  FirstViewCodeProject
//
//  Created by Pedro Botega on 23/07/24.
//

import UIKit

class LoginVC: UIViewController {
   
    
    
    private var loginScreen: LoginScreen?
    private var viewModel: LoginViewModal = LoginViewModal()
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldDelegate(delegate: self)
        viewModel.delegate(delegate: self)
    }


}

extension LoginVC: LoginViewModelProtocol{
    func sucessLogin() {
        let vc: HomeVC = HomeVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
        
    }
    
    func errorLogin(errorMessage: String) {
        print("batata")
    }
    
    
}

extension LoginVC: LoginScreenProtocol{
    func tappedLoginButton() {
        viewModel.login(email: loginScreen?.emailTextField.text ?? "", password: loginScreen?.passwordTextField.text ?? "")
    }
    
    
    
}
extension LoginVC: UITextFieldDelegate {
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        let email: String = loginScreen?.emailTextField.text ?? ""
        let password : String = loginScreen?.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty{
            loginScreen?.loginButton.isEnabled = true
            loginScreen?.loginButton.backgroundColor = .darkGray
        }else{
            loginScreen?.loginButton.backgroundColor = .darkGray.withAlphaComponent(0.6)
            loginScreen?.loginButton.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
