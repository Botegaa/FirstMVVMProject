//
//  HomeViewModel.swift
//  MVVMFirstProject
//
//  Created by Pedro Botega on 07/08/24.
//

import UIKit

class HomeViewModel {
    
    public var numberOfItems: Int { 
        2
    }
    public func sizeForItem(indexPath: IndexPath, frame: CGRect) -> CGSize {
        if indexPath.row == 0 {
           return CGSize(width: 120, height: frame.height)
        }else {
            return CGSize(width: frame.width - 120, height: frame.height)
        }
    }
}
