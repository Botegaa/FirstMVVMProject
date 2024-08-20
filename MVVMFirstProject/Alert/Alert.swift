//
//  Alert.swift
//  MVVMFirstProject
//
//  Created by Pedro Botega on 20/08/24.
//

import UIKit

class Alert{

    private let controller: UIViewController
    
    init(controller: UIViewController){
        self.controller = controller
    }
    public func showAlertInformation (title : String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default)
        
        alertController.addAction(ok)
        controller.present(alertController, animated: true)
        
    }
}
