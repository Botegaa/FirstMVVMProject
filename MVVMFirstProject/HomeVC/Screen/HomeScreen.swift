//
//  HomeScreen.swift
//  MVVMFirstProject
//
//  Created by Pedro Botega on 07/08/24.
//

import UIKit

class HomeScreen: UIView {

    
    lazy var collectionView : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.register(StoryCardCollectionViewCell.self, forCellWithReuseIdentifier: StoryCardCollectionViewCell.identifier)
        cv.register(PostCardCollectionViewCell.self, forCellWithReuseIdentifier: PostCardCollectionViewCell.identifier)
        return cv
    }()
    
    public func configProtocolsCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource){
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .appBackgroundColor
        addSubview(collectionView)
        configConstraints()
   }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints(){
        collectionView.pin(to: self)
       
    }
    
   
}
