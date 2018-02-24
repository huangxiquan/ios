//
//  ViewController.swift
//  Book
//
//  Created by huangxiquan on 2017/9/27.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPageViewControllerDataSource,UIPageViewControllerDelegate {
    
    enum DirectionForward: Int {
        case Before = 1
        case After = 2
    }
    
    var currentPage = 0;
    
    var directionForward = DirectionForward.After;
    
    var pageViewCtrl: UIPageViewController!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.pageViewCtrl = UIPageViewController(transitionStyle: .pageCurl,navigationOrientation: .horizontal,options: nil);
        self.pageViewCtrl.delegate = self;
        self.pageViewCtrl.dataSource = self;
        let storyboard = self.storyboard;
        var page1ViewCtrl = storyboard?.instantiateViewController(withIdentifier: "page1");
        var viewCtrls: [UIViewController] = [page1ViewCtrl!];
        self.pageViewCtrl.setViewControllers(viewCtrls, direction: .forward, animated: true, completion: nil);
        self.view.addSubview(self.pageViewCtrl.view);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        print("before");
        self.currentPage -= 1;
        if(self.currentPage < 0) {
            self.currentPage = 0;
            return nil;
        }
        self.directionForward = DirectionForward.Before;
        var storyboard = self.storyboard;
        let id = String(format: "page%i",self.currentPage + 1);
        let pvCtrl = (storyboard?.instantiateViewController(withIdentifier: id))! as UIViewController;
        return pvCtrl;
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        print("after");
        self.currentPage += 1;
        if(self.currentPage > 2) {
            self.currentPage = 2;
            return nil;
        }
        self.directionForward = DirectionForward.After;
        let storyboard = self.storyboard;
        let id = String(format: "page%i",self.currentPage + 1);
        print(id);
        let pvCtrl = (storyboard?.instantiateViewController(withIdentifier: id))! as UIViewController;
        return pvCtrl;
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
        self.pageViewCtrl.isDoubleSided = false;
        return .min;
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if(completed == false) {
            if(self.directionForward == DirectionForward.After) {
                self.currentPage -= 1;
            }
            
            if(self.directionForward == DirectionForward.Before) {
                self.currentPage += 1;
            }
        }
    }


}

