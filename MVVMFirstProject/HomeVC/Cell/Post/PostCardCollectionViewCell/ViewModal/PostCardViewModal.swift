//
//  PostCardViewModal.swift
//  MVVMFirstProject
//
//  Created by Pedro Botega on 11/08/24.
//

import UIKit

class PostCardViewModal: NSObject {
    private var listPosts:[Posts]
    
    init(listPosts: [Posts]){
        self.listPosts = listPosts
    }
    
    public var numberOfItems : Int {
        listPosts.count
    }

    
    public func loadCurrentStory(indexPath: IndexPath) -> Posts {
        listPosts[indexPath.row]
    }
}
