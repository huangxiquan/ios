//
//  ViewController.swift
//  CollectionView
//
//  Created by huangxiquan on 2017/9/26.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    var events: NSArray!;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //load data
        let path = Bundle.main.path(forResource: "events", ofType: "plist");
        self.events = NSArray(contentsOfFile:path!);
        print(self.events);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        self.events.count / 2;
        return 2;
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.events.count / 2;
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell;
        let event = self.events[indexPath.section * 2 + indexPath.row] as! NSDictionary;
        cell.label.text = event["name"] as! String;
        cell.imageView.image = UIImage(named:event["image"] as! String);
        return cell;
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let event = self.events[indexPath.section * 2 + indexPath.row] as! NSDictionary;
        
        print(String(format: "select event name %@",event["name"]
            as! String));
    }
    
    

}

