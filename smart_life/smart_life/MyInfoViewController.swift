//
//  MyInfoViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/15.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class MyInfoViewController: UIViewController {

    @IBAction func myHealth(sender: AnyObject) {
        let sb = UIStoryboard(name: "Main", bundle:nil)
        let vc = sb.instantiateViewControllerWithIdentifier("NAV12")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    @IBAction func mysport(sender: AnyObject) {
        let sb = UIStoryboard(name: "Main", bundle:nil)
        let vc = sb.instantiateViewControllerWithIdentifier("NAV21")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    @IBAction func myorder(sender: AnyObject) {
        let sb = UIStoryboard(name: "Main", bundle:nil)
        let vc = sb.instantiateViewControllerWithIdentifier("MyOrder")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    @IBAction func mydata(sender: AnyObject) {
        let sb = UIStoryboard(name: "Main", bundle:nil)
        let vc = sb.instantiateViewControllerWithIdentifier("MyData")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    @IBAction func myindent(sender: AnyObject) {
        let sb = UIStoryboard(name: "Main", bundle:nil)
        let vc = sb.instantiateViewControllerWithIdentifier("MyIndent")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func service(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string :"tel://087164589208")!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

        /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
