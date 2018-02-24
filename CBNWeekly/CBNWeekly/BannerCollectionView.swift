//
//  BannerCollectionView.swift
//  CBNWeekly
//
//  Created by huangxiquan on 2017/10/16.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher
import Alamofire

class BannerCollectionView: UICollectionView,UICollectionViewDataSource,UICollectionViewDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var currentPage: CGFloat = 200;
    var startX: CGFloat!;
    var timer: Timer!;
    var data: JSON!;
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame,collectionViewLayout: layout)
        self.showsVerticalScrollIndicator = false;
        self.showsHorizontalScrollIndicator = false;
        self.isPagingEnabled = false;
        self.isScrollEnabled = true;
        self.register(BannerItemCell.self, forCellWithReuseIdentifier: "bannerItemCell");
        self.dataSource = self;
        self.delegate = self;
        self.decelerationRate = UIScrollViewDecelerationRateFast;
        self.backgroundColor = UIColor.white;
        loadData();
    }
    
    func loadData() {
        request(Constants.URL + "banners", method: .get, parameters: ["category":"first"], encoding: URLEncoding.default, headers: nil)
            .responseJSON { (response) in
                print("response...")
                let result = JSON(response.result.value);
                let bannerData = result["data"];
                //                print(bannerData);
                self.setBannerData(data: bannerData);
                
        }
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews();
//        self.scrollToItem(at: IndexPath.init(row: 4, section: 0), at: .top, animated: false)
//    }
    
    override func didMoveToWindow() {
        print("didMoveToWindow")
        self.contentOffset = CGPoint.init(x: 244 * 199, y: 0);
        
    }
    
    override func didMoveToSuperview() {
        print("didMoveToSuperview")
//        UIScrollViewDelegate
        self.contentOffset = CGPoint.init(x: 244 * 199, y: 0);
        self.setContentOffset(CGPoint.init(x: 244 * 199, y: 0), animated: false);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1000;
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        print("willDisplay...");
//        self.banner.contentOffset = CGPoint.init(x: 244 * 199, y: 0);
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
//        let cell: BannerItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCell", for: indexPath) as! BannerItemCell
//        return cell;
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        print(indexPath)
        let cell: BannerItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerItemCell", for: indexPath) as! BannerItemCell
//        let R = CGFloat(arc4random() % 256) / 255.0;
//        let G = CGFloat(arc4random() % 256) / 255.0;
//        let B = CGFloat(arc4random() % 256) / 255.0;
//        let color = UIColor(red: R ,green: G, blue: B, alpha: 1);
//        cell.backgroundColor = UIColor.darkGray;
//        cell.label.text = String(format: "%d" ,(indexPath.row) % 5);
//        cell.snp.makeConstraints { (make) in
////            make.width.equalTo(240);
////            make.height.equalTo(117);
////            make.top.equalTo(self)
////            make.top.equalTo(0);
//        }
        
        if(self.data != nil) {
            let index = (indexPath.row) % 5;
            let itemData = self.data[index];
//            print(itemData)
            if let urlStr = itemData["cover_url"].rawString() {
//                let imageData = try! Data(contentsOf: URL(string: urlStr)!)
//                cell.image.image = UIImage(data: imageData);
//                print(urlStr);
                cell.image.kf.setImage(with: URL(string: urlStr));
            }
            
            if let subTitle = itemData["subtitle"].rawString() {
                cell.subTitle.text = subTitle;
            }
            
            if let title = itemData["title"].rawString() {
                cell.title.text = title;
            }
        }
        
        return cell;

    }
    
    
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.timer.invalidate();
        print("scrollViewWillBeginDragging...");
//        print(scrollView.contentOffset.x);
        self.currentPage = round(scrollView.contentOffset.x.divided(by: CGFloat(244))) + 1;
        self.startX = scrollView.contentOffset.x;
        print(self.currentPage)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("scrollViewDidScroll... \(scrollView.contentOffset.x)");
        if(scrollView.contentOffset.x == 0) {
            scrollView.contentOffset.x = 244 * 199;
        }
        
    }
    
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print("scrollViewWillEndDragging...")
//        print(targetContentOffset.pointee.x);
//        print(scrollView.contentOffset.x);
        let endX = scrollView.contentOffset.x;
//        print(velocity);
//        let desPage = endX > startX ? self.currentPage + 1 : self.currentPage - 1;
//        print(desPage);
        if(endX > startX) {
            self.currentPage += 1;
        }else {
            self.currentPage -= 1;
        }
//        let x = round(scrollView.contentOffset.x / 240) * 240;
//        scrollView.
        print(self.currentPage);
        targetContentOffset.pointee = CGPoint(x: 244 * (self.currentPage - 1),y: targetContentOffset.pointee.y);
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x)
        let offsetX = scrollView.contentOffset.x;
//        if(offsetX == 244 * 6) {
//            scrollView.contentOffs	et.x = 244;
//        }
        startTimer();
    }
    
    func setBannerData(data: JSON) {
        self.data = data;
        self.reloadData();
        startTimer();
    }
    
    func startTimer() -> Void {
        self.timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { (timer) in
            self.currentPage += 1;
//            print(self.currentPage)
            self.scrollToItem(at: IndexPath.init(row: Int(self.currentPage), section: 0), at: UICollectionViewScrollPosition.centeredHorizontally, animated: true);
        })
    }

}
