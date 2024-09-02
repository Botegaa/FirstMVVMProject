//
//  HomeViewModel.swift
//  MVVMFirstProject
//
//  Created by Pedro Botega on 07/08/24.
//

import UIKit

class HomeViewModel {
    
    
    private var posts = [Posts]()
    public var getListPosts: [Posts]{
        posts
    }
    
    private var story = [Story]()

    public var getListStory: [Story]{
        story
    }
    
    public var numberOfItems: Int { //Caso Precise Implementar alguma logica no numero de cell
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
