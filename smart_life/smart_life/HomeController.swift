//
//  HomeController.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/9.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class HomeController: UIViewController, CirCleViewDelegate {
    
    var circleView: CirCleView!

    @IBOutlet weak var HomePageScrollView: UIScrollView!
    @IBOutlet weak var View21: UIViewEffect!
    @IBOutlet weak var View22: UIViewEffect!
    @IBOutlet weak var View23: UIViewEffect!
    @IBOutlet weak var View24: UIViewEffect!
    @IBOutlet weak var View31: UIViewEffect!
    @IBOutlet weak var View41: UIViewEffect!
    @IBOutlet weak var View51: UIViewEffect!
    @IBOutlet weak var View52: UIViewEffect!
    @IBOutlet weak var View53: UIViewEffect!
    @IBOutlet weak var View54: UIViewEffect!
    @IBOutlet weak var View55: UIViewEffect!
    @IBOutlet weak var View56: UIViewEffect!
    @IBOutlet weak var View61: UIViewEffect!
    @IBOutlet weak var View71: UIViewEffect!
    @IBOutlet weak var View72: UIViewEffect!
    @IBOutlet weak var View73: UIViewEffect!
    @IBOutlet weak var View74: UIViewEffect!
    @IBOutlet weak var View81: UIViewEffect!
    @IBOutlet weak var View82: UIViewEffect!
    @IBOutlet weak var View83: UIViewEffect!
    @IBOutlet weak var View84: UIViewEffect!
    @IBOutlet weak var View85: UIViewEffect!
    @IBOutlet weak var View86: UIViewEffect!
    @IBOutlet weak var View91: UIViewEffect!
    @IBOutlet weak var View92: UIViewEffect!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageArray: [UIImage!] = [UIImage(named: "banner1.png"), UIImage(named: "banner2.png"), UIImage(named: "banner3.png")]
        
        self.circleView = CirCleView(frame: CGRectMake(0, 0, self.view.frame.size.width, 220), imageArray: imageArray)
        
        circleView.backgroundColor = UIColor.orangeColor()
        
        circleView.delegate = self
        
        self.HomePageScrollView.addSubview(circleView)
        
        View21.addOnClickListener(self,action:#selector(HomeController().tapSingleDid1))
        View22.addOnClickListener(self,action:#selector(HomeController().tapSingleDid2))
//        View23.addOnClickListener(self,action:#selector(HomeController().tapSingleDid3))
//        View24.addOnClickListener(self,action:#selector(HomeController().tapSingleDid4))
        View31.addOnClickListener(self,action:#selector(HomeController().tapSingleDid5))
        View41.addOnClickListener(self,action:#selector(HomeController().tapSingleDid6))
//        View51.addOnClickListener(self,action:#selector(HomeController().tapSingleDid7))
//        View52.addOnClickListener(self,action:#selector(HomeController().tapSingleDid8))
//        View53.addOnClickListener(self,action:#selector(HomeController().tapSingleDid9))
//        View54.addOnClickListener(self,action:#selector(HomeController().tapSingleDid10))
        
//        View55.addOnClickListener(self,action:#selector(HomeController().tapSingleDid11))
//        View56.addOnClickListener(self,action:#selector(HomeController().tapSingleDid12))
        View61.addOnClickListener(self,action:#selector(HomeController().tapSingleDid13))
        View71.addOnClickListener(self,action:#selector(HomeController().tapSingleDid14))
        View72.addOnClickListener(self,action:#selector(HomeController().tapSingleDid15))
        View73.addOnClickListener(self,action:#selector(HomeController().tapSingleDid16))
//        View74.addOnClickListener(self,action:#selector(HomeController().tapSingleDid17))
        View81.addOnClickListener(self,action:#selector(HomeController().tapSingleDid18))
//        View82.addOnClickListener(self,action:#selector(HomeController().tapSingleDid19))
//        View83.addOnClickListener(self,action:#selector(HomeController().tapSingleDid20))
      
//        View84.addOnClickListener(self,action:#selector(HomeController().tapSingleDid21))
//        View85.addOnClickListener(self,action:#selector(HomeController().tapSingleDid22))
//        View86.addOnClickListener(self,action:#selector(HomeController().tapSingleDid23))
//        View91.addOnClickListener(self,action:#selector(HomeController().tapSingleDid24))
        View92.addOnClickListener(self,action:#selector(HomeController().tapSingleDid25))
        
        // Do any additional setup after loading the view.
    }
    
    /********************************** Privite Methods ***************************************/
    //MARK:- Privite Methods
    func setImage(sender: UIButton) {
        //        circleView.imageArray = [UIImage(named: "first.jpg"), UIImage(named: "third.jpg")]
        circleView.urlImageArray = ["http://pic1.nipic.com/2008-09-08/200898163242920_2.jpg"]
    }
    
    func tapSingleDid1(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV11")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid2(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV12")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid3(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV13")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid4(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV14")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid5(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV21")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid6(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV31")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid7(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV41")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid8(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV41")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid9(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV41")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid10(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV41")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid11(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV41")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid12(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV51")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid13(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV51")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid14(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV61")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid15(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV62")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid16(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV63")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid17(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV64")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid18(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV71")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid19(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV71")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid20(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV71")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid21(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV71")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid22(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV71")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid23(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV71")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid24(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV81")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid25(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV81")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    
    
    /********************************** Delegate Methods ***************************************/
    //MARK:- Delegate Methods
    //MARK: CirCleViewDelegate Methods
    
    func clickCurrentImage(currentIndxe: Int) {
        print(currentIndxe, terminator: "");
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        HomePageScrollView.contentSize = CGSize.init(width: self.view.frame.width, height: 1836)
        HomePageScrollView.showsVerticalScrollIndicator = false;
        HomePageScrollView.showsHorizontalScrollIndicator = false;
        HomePageScrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
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

extension UIView {
    
    func addOnClickListener(target: AnyObject, action: Selector) {
        let gr = UITapGestureRecognizer(target: target, action: action)
        gr.numberOfTapsRequired = 1
        userInteractionEnabled = true
        addGestureRecognizer(gr)
    }
}

class UIViewEffect : UIView {
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        backgroundColor = UIColor.orangeColor()
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        UIView.animateWithDuration(0.15, animations: { () -> Void in
            self.backgroundColor = UIColor.clearColor()
        })
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        UIView.animateWithDuration(0.15, animations: { () -> Void in
            self.backgroundColor = UIColor.whiteColor()
        })
    }
    
}
