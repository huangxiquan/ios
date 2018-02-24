//
//  BannerAutoLayout.swift
//  CBNWeekly
//
//  Created by huangxiquan on 2017/10/13.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit
import SnapKit
import SwiftyJSON

class BannerAutoLayout: UIScrollView ,UIScrollViewDelegate{

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    static let gap = 4;
    static let itemWidth = 240;
    var timer: Timer!;
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0));
//        self.backgroundColor = UIColor.blue;
        self.bounces = false;
        self.showsVerticalScrollIndicator = false;
        self.showsHorizontalScrollIndicator = false;
        self.isScrollEnabled = true;
        self.isPagingEnabled = true;
        self.clipsToBounds = false;
        self.delegate = self;
//        self.contentSize.height = 0;
        
        let container = UIView();
        self.addSubview(container);
        container.snp.makeConstraints { (make) in
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
            make.height.equalTo(117);
        }
        for index in 0...8 {
            let item = BannerItemAutoLayout();
            container.addSubview(item);
            item.snp.makeConstraints { (make) in
                make.top.height.equalTo(container);
                make.width.equalTo(BannerAutoLayout.itemWidth);
                //            make.height.equalTo(117);
                make.left.equalTo(container).offset(index * (BannerAutoLayout.gap + BannerAutoLayout.itemWidth) - 176);
                if(index == 8) {
                    container.snp.makeConstraints({ (make) in
                        make.right.equalTo(item)
                    })
                }
                
            }
            
        }
        
        
        
    }
    
    func setBannerData(data: JSON) {
        let childs = self.subviews[0].subviews;
//        print(childs);
        for (index,child) in childs.enumerated() {
                        print(index)
            let itemData = data[(index + 3) % 5];
            //            print(itemData);
            let item: BannerItemAutoLayout = child as! BannerItemAutoLayout;
            if let urlStr = itemData["cover_url"].rawString() {
                let imageData = try! Data(contentsOf: URL(string: urlStr)!)
                item.image.image = UIImage(data: imageData);
            }
            if let subtitle = itemData["subtitle"].rawString() {
                
//                let size = NSString(string: subtitle).boundingRect(with: CGSize(width: 240,height: 30), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName : item.subtitle.font], context: nil);
//                //                print(size)
//                item.subtitle.frame.size = size.size;
                //                print(subtitle)
                item.subTitle.text = subtitle;
            }
            
            if let title = itemData["title"].rawString() {
//                let size = NSString(string: title).boundingRect(with: CGSize(width: 240,height: 50), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName : item.title.font], context: nil);
//                print(size)
//                item.title.frame.size = size.size;
                item.title.text = title;
            }
            
        }
        
        startTimer();
    }
    
    func startTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (timer) in
//                        print(self.contentOffset);
//            let gap =  round(4 * Constants.widthScale);
            var x = self.contentOffset.x;
            //            print(x);
            if(x == CGFloat((BannerAutoLayout.itemWidth + BannerAutoLayout.gap) * 5 )) {
                self.contentOffset.x = 0;
            }
            x = self.contentOffset.x;
            
            self.setContentOffset(CGPoint(x: x + CGFloat(BannerAutoLayout.itemWidth + BannerAutoLayout.gap) ,y: 0), animated: true);
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
            scrollView.contentOffset.x = CGFloat((BannerAutoLayout.itemWidth + BannerAutoLayout.gap) * 5);
        }else if(offset == CGFloat((BannerAutoLayout.itemWidth + BannerAutoLayout.gap) * 6)) {
            scrollView.contentOffset.x = CGFloat(BannerAutoLayout.itemWidth + BannerAutoLayout.gap);
        }
        //        self.timer.fireDate = Date.distantPast;
        startTimer()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
