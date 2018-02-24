//
//  HomeTableViewController.swift
//  CBNWeekly
//
//  Created by huangxiquan on 2017/9/28.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class HomeTableViewController: UITableViewController {
    
    var bannerData : JSON!;

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
//        let homeNav: UINavigationController = self.parent as! UINavigationController;
//        homeNav.tit
        
        initHomeNav();
        
        registerCell();
        
        loadData();
//        self.tableView.isScrollEnabled = false;
     }
    
   
    
    func loadData() {
//        print(Constants.URL + "banners?");
        request(Constants.URL + "banners", method: .get, parameters: ["category":"first"], encoding: URLEncoding.default, headers: nil)
        .responseJSON { (response) in
            print("response...")
            let result = JSON(response.result.value);
            self.bannerData = result["data"];
//            print(self.bannerData);
            self.tableView.reloadData();
        }
        
//        request(Constants.URL + "banners?category=first",)
//        let a: String = "hello";
//        a.asURL()
    }
    
    func registerCell() {
        self.tableView.register(BannerTableViewCell.self, forCellReuseIdentifier: "banner");
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
        self.tableView.reloadData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("tableview cellForRowAt...");
        let cell: BannerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "banner", for: indexPath) as! BannerTableViewCell;
        
//        cell.data = self.bannerData;
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
