//
//  StoryCardCollectionViewCell.swift
//  MVVMFirstProject
//
//  Created by Pedro Botega on 08/08/24.
//

import UIKit

class StoryCardCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "StoryCardCollectionViewCell"
    
    private var screen : StoryCardCollectionViewCellScreen = StoryCardCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen(){
        screen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(screen)
        screen.pin(to: contentView)
        
    }
    
}
