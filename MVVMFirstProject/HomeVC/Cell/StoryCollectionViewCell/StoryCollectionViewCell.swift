//
//  StoryCollectionViewCell.swift
//  MVVMFirstProject
//
//  Created by Pedro Botega on 08/08/24.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier: String = "StoryCollectionViewCell"
    private var screen : StoryCollectionViewCellScreen = StoryCollectionViewCellScreen()
    
    
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
    
    public func setupCell(data: Story, indexPath: IndexPath){
        screen.profileImageView.image = UIImage(named: data.image)
        screen.userNameLabel.text = data.username
        screen.addButton.isHidden = indexPath.row == 0 ? false : true
    }
}
