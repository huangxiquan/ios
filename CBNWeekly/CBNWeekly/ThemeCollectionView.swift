//
//  ThemeCollectionView.swift
//  CBNWeekly
//
//  Created by huangxiquan on 2017/10/25.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class ThemeCollectionView: UICollectionView, UICollectionViewDataSource {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout);
        self.dataSource = self;
        self.register(ThemeItemCell.self, forCellWithReuseIdentifier: "themeItemCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("theme item...")
        let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "themeItemCell", for: indexPath)
        return itemCell;
    }

}
