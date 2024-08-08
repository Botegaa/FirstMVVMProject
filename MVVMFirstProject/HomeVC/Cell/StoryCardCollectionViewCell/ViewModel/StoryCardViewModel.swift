//
//  StoryCardViewModel.swift
//  MVVMFirstProject
//
//  Created by Pedro Botega on 08/08/24.
//

import UIKit

class StoryCardViewModel {
    
    private var listStory:[Story]
    
    init(listStory: [Story]){
        self.listStory = listStory
    }
    
    public var numberOfItems : Int {
        listStory.count
    }

    
    func loadCurrentStory(indexPath: IndexPath) -> Story {
        listStory[indexPath.row]
    }
}
