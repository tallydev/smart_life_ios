//
//  HomeViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/6/13.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, CirCleViewDelegate {
    var circleView: CirCleView!
    
    /********************************** System Methods *****************************************/
    //MARK:- System Methods
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.title = "CirCle"
        self.automaticallyAdjustsScrollViewInsets = false
        let imageArray: [UIImage!] = [UIImage(named: "banner1.png"), UIImage(named: "banner2.png"), UIImage(named: "banner3.png")]
        
        self.circleView = CirCleView(frame: CGRectMake(0, 0, self.view.frame.size.width, 200), imageArray: imageArray)
        circleView.backgroundColor = UIColor.orangeColor()
        circleView.delegate = self
        self.view.addSubview(circleView)
        
        let tempButton = UIButton(frame: CGRectMake(0, 300, self.view.frame.size.width, 20))
        tempButton.backgroundColor = UIColor.redColor()
        tempButton.setTitle("appendImage", forState: UIControlState.Normal)
        tempButton.addTarget(self, action: #selector(HomeViewController.setImage(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(tempButton)
    }
    
    
    /********************************** Privite Methods ***************************************/
    //MARK:- Privite Methods
    func setImage(sender: UIButton) {
        //        circleView.imageArray = [UIImage(named: "first.jpg"), UIImage(named: "third.jpg")]
        circleView.urlImageArray = ["http://pic1.nipic.com/2008-09-08/200898163242920_2.jpg"]
    }
    
    
    
    
    /********************************** Delegate Methods ***************************************/
    //MARK:- Delegate Methods
    //MARK: CirCleViewDelegate Methods
    
    func clickCurrentImage(currentIndxe: Int) {
        print(currentIndxe, terminator: "");
    }
    
    
    
    
    /***************************** End & ReceiveMe Methods ************************************/
    //MARK:- End Methods
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

