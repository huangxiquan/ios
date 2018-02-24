//
//  ViewController.swift
//  PageControl
//
//  Created by huangxiquan on 2017/9/27.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    var page1: UIView!;
    var page2: UIView!;
    var page3: UIView!;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.scrollView.delegate = self;
        self.scrollView.contentSize = CGSize(width:self.view.frame.size.width * 3,height: self.scrollView.frame.height);
        var storyboard = self.storyboard;
        var page1VCtrl = storyboard?.instantiateViewController(withIdentifier: "page1");
        self.page1 = page1VCtrl?.view;
        self.page1.frame = CGRect(x:0.0,y:0.0,width:375.0,height:667.0);
        var page2Vctrl = storyboard?.instantiateViewController(withIdentifier: "page2");
        self.page2 = page2Vctrl?.view;
        self.page2.frame = CGRect(x:320.0,y:0.0,width:375.0,height:667.0);
        var page3Vctrl = storyboard?.instantiateViewController(withIdentifier: "page3");
        self.page3 = page3Vctrl?.view;
        self.page3.frame = CGRect(x:320.0 * 2,y:0.0,width:375.0,height:667.0);
        
        self.scrollView.addSubview(self.page1);
        self.scrollView.addSubview(self.page2);
        self.scrollView.addSubview(self.page3);

        
        }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var offset = self.scrollView.contentOffset;
        self.pageControl.currentPage = Int(offset.x) / 375;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changePage(_ sender: Any) {
        print("changePage");
        UIView.animate(withDuration: 0.3) { 
            var currentPage = self.pageControl.currentPage;
            self.scrollView.contentOffset = CGPoint(x: 375 * currentPage,y: 0);
        }
    }

}

