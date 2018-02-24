//
//  DetailViewController.swift
//  MixNavigation
//
//  Created by huangxiquan on 2017/9/28.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var city: NSDictionary!;
    
    @IBOutlet weak var webview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = city["url"] as! String;
        let request = URLRequest(url: URL(string: url)!);
        self.webview.loadRequest(request);
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
