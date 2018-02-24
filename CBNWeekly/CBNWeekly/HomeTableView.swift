//
//  HomeTableView.swift
//  CBNWeekly
//
//  Created by huangxiquan on 2017/10/19.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeTableView: UITableView,UITableViewDataSource, UITableViewDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var homeList: [JSON] = [];
    var page: Int = 1;
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame,style: style)
        print("init...")
        self.register(BannerTableViewCell.self, forCellReuseIdentifier: "bannerCell");
        self.register(HomeTableViewCell.self, forCellReuseIdentifier: "articleCell");
        self.register(HomeThemeTableViewCell.self, forCellReuseIdentifier: "themeCell")
//        UITableViewHeaderFooterView
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyle.singleLine;
        self.estimatedRowHeight = 10;
        self.rowHeight = UITableViewAutomaticDimension;
        self.delegate = self;
//        self.isUserInteractionEnabled = false;
        loadData(page: self.page);
//        let foot = UILabel();
//        foot.text = "foot...";
//        self.tableFooterView?.addSubview(foot)
        
        let footer = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.bounds.width, height: 30));
//        foot.text = "foot...";
//        footer.backgroundColor = UIColor.darkGray;
        let loading = UIActivityIndicatorView.init(activityIndicatorStyle: .gray)
        footer.addSubview(loading);
        loading.snp.makeConstraints { (make) in
            make.center.equalTo(footer)
//            make.width.height.equalTo(20);
        }
        loading.startAnimating();
        self.tableFooterView = footer;
        
    }
    
    func loadData(page: Int) {
        request(Constants.URL + "first_page_infos", method: .get, parameters: [ "page": page], encoding: URLEncoding.default, headers: nil)
//        request(Constants.URL + "first_page_infos")
            .responseJSON { (response) in
                print("first page info response...: \(self.homeList.count)")
                let result = JSON(response.result.value);
                self.homeList += result["data"].array!;
//                print(result["data"].array)
//                self.homeList.append(result["data"].array!);
//                self.homeList.append(result["data"].array!)
//                if(self.homeList == nil) {
////                    self.homeList.result["data"].array;
//                    
//                }else {
////                    print()
//                }
//                self.homeList = result["data"];
//                print(self.homeList);
//                self.setBannerData(data: bannerData);
                self.reloadData();
                
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection...\(self.homeList.count)");
        return self.homeList.count + 1;
//        if let count = self.homeList?.count {
//            return count + 1;
//        }else {
//            return 1;
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0) {
            let bannerCell = tableView.dequeueReusableCell(withIdentifier: "bannerCell") as! BannerTableViewCell;
            //        bannerCell.banner.contentOffset = CGPoint.init(x: 244 * 199, y: 0);
            return bannerCell;
        }
//        print("article item...")
        let item = self.homeList[indexPath.row - 1] as! JSON;
        if let type = item["type"].rawString() {
            if(type == "normal_article" || type == "magazine_article" || type == "top_article") {
//                print(type);
                let articleCell = tableView.dequeueReusableCell(withIdentifier: "articleCell") as! HomeTableViewCell;
//                let article = self.homeList[indexPath.row - 1] as! JSON;
                articleCell.setArticleData(article: item );
                return articleCell;
            }else {
//                print("theme item:\(item)");
                let themeCell = tableView.dequeueReusableCell(withIdentifier: "themeCell") as! HomeThemeTableViewCell;
                return themeCell;
                
            }
        }
        return UITableViewCell();
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if(scrollView.contentOffset.y > (scrollView.contentSize.height - scrollView.frame.size.height - 30)) {
            print("bottom... ...")
            self.page += 1;
            loadData(page: self.page);
        }
    }
    
    
    
}
