//
//  HomeThemeTableViewCell.swift
//  CBNWeekly
//
//  Created by huangxiquan on 2017/10/25.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class HomeThemeTableViewCell: UITableViewCell {
    
    var themeCollection: ThemeCollectionView!;

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        let container = UIView();
        self.contentView.addSubview(container);
        container.snp.makeConstraints { (make) in
            make.edges.equalTo(self.contentView);
        }
        
        let label = UILabel();
        label.text = "专题推荐"
        container.addSubview(label);
        label.snp.makeConstraints { (make) in
            make.top.left.equalTo(container)
            make.height.equalTo(30);
        }
        let viewLayout = UICollectionViewFlowLayout();
        viewLayout.itemSize = CGSize(width: 240,height: 117);
        viewLayout.scrollDirection = UICollectionViewScrollDirection.horizontal;
//        viewLayout.sectionInset.left = -176;
//        viewLayout.minimumLineSpacing = 4;
        self.themeCollection = ThemeCollectionView(frame: CGRect(x: 0,y: 0,width: 0,height: 0),collectionViewLayout: viewLayout);
//        self.themeTable.backgroundColor = UIColor.blue;
        container.addSubview(self.themeCollection);
        self.themeCollection.snp.makeConstraints { (make) in
            make.height.equalTo(117);
//            make.left.top.right.equalTo(container);
//            make.edges.equalTo(container)
            make.top.equalTo(label.snp.bottom);
            make.left.right.bottom.equalTo(container);
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
