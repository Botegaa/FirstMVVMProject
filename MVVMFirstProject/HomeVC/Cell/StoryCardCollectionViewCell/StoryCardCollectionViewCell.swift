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
    
    private var viewModal : StoryCardViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configScreen()
        screen.configProtocolsCollectionView(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen(){
        screen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(screen)
        screen.pin(to: contentView)
        
    }
    
    public func setupCell(listStory: [Story]){
        viewModal = StoryCardViewModel(listStory: listStory)
    }
    
}
extension StoryCardCollectionViewCell : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModal?.numberOfItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModal = viewModal else {return UICollectionViewCell()}
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell
        cell?.setupCell(data: viewModal.loadCurrentStory(indexPath: indexPath), indexPath: indexPath)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 120)
    }
}
