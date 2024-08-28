//
//  HomeService.swift
//  MVVMFirstProject
////  Created by Pedro Botega on 28/08/24.
//

import UIKit

class HomeService {
    
    func getHomeDataJson(completion: @escaping(Posts?, Error?)-> Void){
        if let url = Bundle.main.url(forResource: "HomeData", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                
            } catch  {
                
            }
        }
    }

}
