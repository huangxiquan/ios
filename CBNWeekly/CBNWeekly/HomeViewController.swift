//
//  HomeViewController.swift
//  CBNWeekly
//
//  Created by huangxiquan on 2017/9/30.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeViewController: UIViewController {
    
    var bannerWidth = 240 * Constants.widthScale;
    var bannerHeight = 117 * Constants.heightScale;;
//    var banner: Banner!;
//    var banner: BannerAutoLayout!;
    var banner: BannerCollectionView!;
    var homeTableView: HomeTableView!;

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.edgesForExtendedLayout = UIRectEdge.
        print(Constants.widthScale);
        
        initHomeNav();
        self.navigationController?.navigationBar.isTranslucent = false;
        
        
        
//        self.banner = Banner(frame: CGRect(x:0,y:0,width: self.bannerWidth + round(4 * Constants.widthScale),height: self.bannerHeight));
//        self.view.addSubview(banner);
//        loadData();
        
        //autolayout
//        self.banner = BannerAutoLayout();
//       
//        self.view.addSubview(self.banner);
//        self.banner.snp.makeConstraints { (make) in
////            make.centerY.equalTo(self.view.snp.centerY)
////            make.left.right.equalTo(self.view);
//            make.width.equalTo(240 + 4);
//            make.left.equalTo(self.view);
//            make.height.equalTo(117);
////            print(self.banner.contentSize)
//        }
//        loadData();
        
        //collectionview
//        self.automaticallyAdjustsScrollViewInsets = false;
//        let viewLayout = UICollectionViewFlowLayout();
//        viewLayout.itemSize = CGSize(width: 240,height: 117);
//        viewLayout.scrollDirection = UICollectionViewScrollDirection.horizontal;
//        viewLayout.sectionInset.left = -176;
////        print(viewLayout.sectionInset);
//        viewLayout.minimumLineSpacing = 4;
////        viewLayout.minimumInteritemSpacing = 0;
//        self.banner = BannerCollectionView(frame: CGRect(x: 0,y: 0,width: 0,height: 0),collectionViewLayout: viewLayout);
////        self.banner.clipsToBounds = false;
//        self.banner.backgroundColor = UIColor.white;
        
        
        
//        self.view.addSubview(self.banner);
        
//        self.banner.snp.makeConstraints { (make) in
//            make.leading.trailing.equalTo(self.view);
//            make.height.equalTo(117);
//        }
        
        
        //list
        
        homeTableView = HomeTableView();
        self.view.addSubview(homeTableView);
//        print(self.banner.snp.bottom);
        self.homeTableView.snp.makeConstraints { (make) in
//            make.left.right.equalTo(self.view)
//            make.top.equalTo(self.view).offset(117)
//            make.bottom.equalTo(self.view)
            make.edges.equalTo(self.view)
        }
        self.homeTableView.separatorInset = UIEdgeInsets.zero;
        self.homeTableView.layoutMargins = UIEdgeInsets.zero;
//        loadData();
        
//        let foot = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 30));
//        foot.text = "foot...";
//        self.homeTableView.tableFooterView = foot;
//        foot.snp.makeConstraints { (make) in
//            make.edges.equalTo(self.homeTableView.tableFooterView!)
//        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.banner.scrollToItem(at: IndexPath.init(row: 2, section: 0), at: .top, animated: false);
//        self.banner.contentOffset.x = 244;
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        self.banner.contentOffset = CGPoint.init(x: 244 * 199, y: 0);
//        self.banner.scrollToItem(at: IndexPath.init(row: 2, section: 0), at: .top, animated: false);
    }
    
    func initHomeNav() {
        //标题
        let titleView = UIImageView(frame: CGRect(x:0,y:0,width:100,height:27));
        titleView.image = UIImage(named: "CBNWeekly_Nav");
        self.navigationItem.titleView = titleView;
        
        //右侧按钮
        
        let searchButton = UIButton(frame: CGRect(x:0,y:0,width:18,height:18));
        searchButton.setImage(UIImage(named: "searchIcon")?.withRenderingMode(.alwaysOriginal),for: .normal);
        searchButton.addTarget(self, action: #selector(goToSearch), for: UIControlEvents.touchUpInside)
        //        searchView.addge
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchButton);
    }
    
    func goToSearch() {
        print("search...")
        
        print(self.banner.collectionViewLayout);
        let layout = self.banner.collectionViewLayout as! UICollectionViewFlowLayout;
        print(self.banner.contentSize);
//        print(layout.sectionInset)
//        print(layout.itemSize)
//        print(layout.headerReferenceSize);
//        print(layout.footerReferenceSize);
////        print(self.banner.bounds)
//        print(self.banner.subviews)
//        print(self.na)
        
    }
    
    func loadData() {
        request(Constants.URL + "banners", method: .get, parameters: ["category":"first"], encoding: URLEncoding.default, headers: nil)
            .responseJSON { (response) in
                print("response...")
                let result = JSON(response.result.value);
                let bannerData = result["data"];
//                print(bannerData);
                self.banner.setBannerData(data: bannerData);
                
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
