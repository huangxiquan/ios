//
//  BannerItem.swift
//  CBNWeekly
//
//  Created by huangxiquan on 2017/10/12.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class BannerItem: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var image: UIImageView!;
    var subtitle: UILabel!;
    var title: UILabel!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
//        print(frame);
        self.image = UIImageView(frame: CGRect(x: 0, y:0, width: frame.width,height: frame.height));
        let R = CGFloat(arc4random() % 256) / 255.0;
        let G = CGFloat(arc4random() % 256) / 255.0;
        let B = CGFloat(arc4random() % 256) / 255.0;
        let color = UIColor(red: R ,green: G, blue: B, alpha: 1);
        self.image.backgroundColor = color;
        self.subtitle = UILabel(frame: CGRect(origin: CGPoint(x: 10 * Constants.widthScale,y: 74 * Constants.heightScale),size: CGSize(width: 0,height: 0)));
        self.subtitle.layer.backgroundColor = UIColor.white.cgColor;
        self.subtitle.layer.cornerRadius = 2;
        self.subtitle.font = UIFont.boldSystemFont(ofSize: 10);
        
        
        
        self.title = UILabel(frame: CGRect(origin: CGPoint(x: 10 * Constants.widthScale,y: 91 * Constants.heightScale),size: CGSize(width: 0,height: 0)));
        self.title.font = UIFont.boldSystemFont(ofSize: 16)
        self.title.textColor = UIColor.white;
        
        self.addSubview(self.image);
        self.addSubview(self.subtitle);
        self.addSubview(self.title);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
