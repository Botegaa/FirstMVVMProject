//
//  HomeViewModel.swift
//  MVVMFirstProject
//
//  Created by Pedro Botega on 07/08/24.
//

import UIKit

class HomeViewModel {
    
    private var story = [
        Story(image: "img1", username: "Add Story"),
        Story(image: "img2", username: "jack"),
        Story(image: "img3", username: "carolina"),
        Story(image: "img4", username: "samuel"),
        Story(image: "img5", username: "ariana josep"),
        Story(image: "img6", username: "puggy_101"),
        Story(image: "img7", username: "dheeraj_ks"),
]

    public var getListStory: [Story]{
        story
    }
    
    public var numberOfItems: Int { //Caso Precise Implementar alguma logica no numero de celulas
        1
    }
    public func sizeForItem(indexPath: IndexPath, frame: CGRect) -> CGSize {
        if indexPath.row == 0 {
           return CGSize(width: 120, height: frame.height)
        }else {
            return CGSize(width: frame.width - 120, height: frame.height)
        }
    }
}
