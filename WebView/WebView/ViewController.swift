//
//  ViewController.swift
//  WebView
//
//  Created by huangxiquan on 2017/9/25.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loadHTMLString(_ sender: Any) {
        print("loadHTMLString")
        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html");
        let bundleUrl = NSURL.fileURL(withPath: Bundle.main.bundlePath);
        var error: NSError;
        do {
            let html = try String(contentsOfFile: htmlPath!,encoding: String.Encoding.utf8);
            print(html);
            self.webView.loadHTMLString(html,baseURL: bundleUrl);
        }catch {
            print(error)
        }
        
    }

    @IBAction func loadData(_ sender: Any) {
        print("loadData")
        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html");
        let bundleURL = NSURL.fileURL(withPath: Bundle.main.bundlePath);
        let htmlData = NSData(contentsOfFile: htmlPath!);
        self.webView.load(htmlData as! Data, mimeType: "text/html", textEncodingName: "utf-8", baseURL: bundleURL)
        
    }

    @IBAction func loadRequest(_ sender: Any) {
        print("loadRequest")
        let url = URL(string: "https://www.baidu.com");
        let request = NSURLRequest(url: url!);
        self.webView.loadRequest(request as URLRequest);
        self.webView.delegate = self;
        
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("webViewDidStartLoad... ...")
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("webview load finish...")
    }
}

