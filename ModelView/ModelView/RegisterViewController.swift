//
//  RegisterViewController.swift
//  ModelView
//
//  Created by huangxiquan on 2017/9/27.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true) { 
            print("dismiss");
        }
    }
    
    @IBAction func save(_ sender: Any) {
        self.dismiss(animated: true) { 
            print("dismiss");
            let param: [String:String] = ["userName": self.userName.text!];
            print(param);
            NotificationCenter.default.post(name: NSNotification.Name("register"), object: nil,userInfo: param);
        }
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
