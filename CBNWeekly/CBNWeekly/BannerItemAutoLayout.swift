//
//  BannerItemAutoLayout.swift
//  CBNWeekly
//
//  Created by huangxiquan on 2017/10/13.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit
import SnapKit

class BannerItemAutoLayout: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var subTitle: UILabel!;
    var title: UILabel!;
    var image: UIImageView!;
    
    init() {
        super.init(frame: CGRect(x:0,y:0,width:0,height:0));
        let R = CGFloat(arc4random() % 256) / 255.0;
        let G = CGFloat(arc4random() % 256) / 255.0;
        let B = CGFloat(arc4random() % 256) / 255.0;
        let color = UIColor(red: R ,green: G, blue: B, alpha: 1);
//        self.backgroundColor = color;
        self.image = UIImageView();
        image.backgroundColor = color;
        self.addSubview(self.image);
        self.image.snp.makeConstraints { (make) in
            make.edges.equalTo(self);
        }
        
        self.subTitle = UILabel();
        self.subTitle.font = UIFont.boldSystemFont(ofSize: 10);
        self.subTitle.backgroundColor = UIColor.white;
//        self.subTitle.text = "hello";
        self.addSubview(subTitle);
        self.subTitle.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(10);
            make.top.equalTo(self).offset(74)
        }
        
        self.title = UILabel();
        self.title.font = UIFont.boldSystemFont(ofSize: 16);
        self.title.textColor = UIColor.white;
//        self.title.text = "world";
        self.addSubview(title);
        self.title.snp.makeConstraints { (make) in
            make.top.equalTo(self.subTitle.snp.bottom).offset(5);
            make.left.equalTo(self.subTitle)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
