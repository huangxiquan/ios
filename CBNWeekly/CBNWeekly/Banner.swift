//
//  Banner.swift
//  CBNWeekly
//
//  Created by huangxiquan on 2017/10/11.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit
import SwiftyJSON

class Banner: UIScrollView,UIScrollViewDelegate {
    
    var screenWidth = Constants.screenWidth;
    var bannerWidth = round(240 * Constants.widthScale);
    var bannerHeight = round(117 * Constants.heightScale);
    var timer: Timer!;

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        print(self.bannerWidth)
        self.contentSize = CGSize(width: self.bannerWidth * 8 + 7 * round(4 * Constants.widthScale),height: 0);
        self.showsVerticalScrollIndicator = false;
        self.showsHorizontalScrollIndicator = false;
        self.isScrollEnabled = true;
        self.isPagingEnabled = true;
        self.clipsToBounds = false;
        self.bounces = false;
        self.delegate = self;
        for (index) in 0...8 {
            let x = CGFloat(index) * self.bannerWidth - round(176 * Constants.widthScale) + CGFloat(index) * round(4 * Constants.widthScale);
            
            print(x);
//            let parent: UIView = UIView(frame:CGRect(x: x,y: 0, width: self.bannerWidth,height: self.bannerHeight));
//            parent.addSubview(<#T##view: UIView##UIView#>)
            let item = BannerItem(frame:CGRect(x: x,y: 0, width: self.bannerWidth,height: self.bannerHeight));
//            let R = CGFloat(arc4random() % 256) / 255.0;
//            let G = CGFloat(arc4random() % 256) / 255.0;
//            let B = CGFloat(arc4random() % 256) / 255.0;
//            let color = UIColor(red: R ,green: G, blue: B, alpha: 1);
//            imageView.backgroundColor = color;
//            let category = UILabel(frame: CGRect(origin: CGPoint(x: 0,y: 0),size: CGSize(width: 0,height: 0)));
//            category.text = "hello world"
//            category.backgroundColor = UIColor.white;
//            imageView.addSubview(category)
            self.addSubview(item);
        }
        self.contentOffset = CGPoint(x:self.bannerWidth + round(4 * Constants.widthScale),y:0);

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
//        super.init(coder: aDecoder)
    }
    
   
    
    func setBannerData(data: JSON) {
        let childs = self.subviews;
        for (index,child) in childs.enumerated() {
            //            print(index)
            let itemData = data[(index + 3) % 5];
//            print(itemData);
            let item: BannerItem = child as! BannerItem;
            if let urlStr = itemData["cover_url"].rawString() {
                let imageData = try! Data(contentsOf: URL(string: urlStr)!)
                item.image.image = UIImage(data: imageData);
            }
            if let subtitle = itemData["subtitle"].rawString() {
                
                let size = NSString(string: subtitle).boundingRect(with: CGSize(width: 240,height: 30), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName : item.subtitle.font], context: nil);
//                print(size)
                item.subtitle.frame.size = size.size;
//                print(subtitle)
                item.subtitle.text = subtitle;
            }
            
            if let title = itemData["title"].rawString() {
                let size = NSString(string: title).boundingRect(with: CGSize(width: 240,height: 50), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName : item.title.font], context: nil);
                print(size)
                item.title.frame.size = size.size;
                item.title.text = title;
            }
            
        }
        startTimer();
    }
    
    func startTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (timer) in
            //            print(self.contentOffset);
            let gap =  round(4 * Constants.widthScale);
            var x = self.contentOffset.x;
//            print(x);
            if(x == (self.bannerWidth + gap) * 5 ) {
                self.contentOffset.x = 0;
            }
            x = self.contentOffset.x;
            
            self.setContentOffset(CGPoint(x: x + self.bannerWidth + gap ,y: 0), animated: true);
            //            print(self.contentOffset);
            //            print("=============");
            
        }
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        print("scrollViewWillBeginDecelerating...");
        self.timer.invalidate();
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating.....");
        let offset = round(scrollView.contentOffset.x);
        print(offset);
        if(offset == 0) {
            scrollView.contentOffset.x = (self.bannerWidth + round(4 * Constants.widthScale)) * 5;
        }else if(offset == (self.bannerWidth + round(4 * Constants.widthScale)) * 6) {
            scrollView.contentOffset.x = self.bannerWidth;
        }
//        self.timer.fireDate = Date.distantPast;
        startTimer();
    }
    
    

}
