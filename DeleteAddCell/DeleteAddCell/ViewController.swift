//
//  ViewController.swift
//  DeleteAddCell
//
//  Created by huangxiquan on 2017/9/27.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    @IBOutlet var add: UITextField!
    var list: [String]!;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem;
        self.navigationItem.title = "单元格的插入和删除";
        self.list = ["黑龙江","吉林","辽宁"];
        self.add.isHidden = true;
        
        let refresh = UIRefreshControl();
        refresh.attributedTitle = NSAttributedString(string: "下拉刷新");
        refresh.addTarget(self, action: "refreshTableView", for: UIControlEvents.valueChanged);
        self.refreshControl = refresh;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated);
        self.tableView.setEditing(editing, animated: animated);
        if(editing) {
            self.add.isHidden = false;
        }else {
            self.add.isHidden = true;
        }
    }
    
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        if(indexPath.row == self.list.count) {
            return false;
        }else {
            return true;
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count + 1;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell;
        if(indexPath.row == list.count) {
            cell.contentView.addSubview(self.add);
        }else {
            cell.textLabel?.text = list[indexPath.row];
        }
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if(indexPath.row == self.list.count) {
            return UITableViewCellEditingStyle.insert;
        }else {
            return UITableViewCellEditingStyle.delete;
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.delete) {
            self.list.remove(at: indexPath.row);
            self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }else if(editingStyle == UITableViewCellEditingStyle.insert) {
            self.list.insert(self.add.text!, at: self.list.count);
            self.tableView.insertRows(at: [indexPath], with: UITableViewRowAnimation.fade);
        }
        
        self.tableView.reloadData();
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    
    func refreshTableView() {
        print("refreshTableView...");
        if(self.refreshControl?.isRefreshing)! {
            self.refreshControl?.attributedTitle = NSAttributedString(string:"加载中...");
            Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: { (t) in
                self.refreshControl?.endRefreshing();
                print("done...");
                self.refreshControl?.attributedTitle = NSAttributedString(string: "下拉刷新");
            });
            
            
        }
    }

}

