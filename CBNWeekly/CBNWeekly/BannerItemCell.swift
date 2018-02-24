//
//  BannerItemCell.swift
//  CBNWeekly
//
//  Created by huangxiquan on 2017/10/16.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class BannerItemCell: UICollectionViewCell {
    
    var subTitle: UILabel!;
    var image: UIImageView!;
    var title: UILabel!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
//        print(frame);
        
        self.image = UIImageView();
        self.image.backgroundColor = UIColor.blue;
        self.contentView.addSubview(image)
        self.image.snp.makeConstraints { (make) in
            make.edges.equalTo(self.contentView);
        }
        
        self.subTitle = UILabel();
        self.subTitle.text = "hello";
        self.subTitle.font = UIFont.boldSystemFont(ofSize: 10);
        self.subTitle.layer.backgroundColor = UIColor.white.cgColor;
        self.subTitle.layer.cornerRadius = 2;
        self.contentView.addSubview(subTitle);
        self.subTitle.snp.makeConstraints { (make) in
//            make.center.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(10);
            make.top.equalTo(self.contentView).offset(74);
        }
        
        self.title = UILabel();
        self.title.text = "world";
        self.title.font = UIFont.boldSystemFont(ofSize: 16);
        self.title.textColor = UIColor.white;
        self.contentView.addSubview(self.title);
        self.title.snp.makeConstraints { (make) in
            make.left.equalTo(self.subTitle);
            make.top.equalTo(self.subTitle.snp.bottom).offset(4);
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
