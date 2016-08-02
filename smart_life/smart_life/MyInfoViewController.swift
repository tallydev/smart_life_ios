//
//  MyInfoViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/15.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MBProgressHUD

class MyInfoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var loginOut: UIButton!
    
    @IBOutlet weak var userAvatar: UIButton!
    
    @IBAction func setAvatar(sender: AnyObject) {
        //判断设置是否支持图片库
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
            //初始化图片控制器
            let picker = UIImagePickerController()
            //设置代理
            picker.delegate = self
            //指定图片控制器类型
            picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            //弹出控制器，显示界面
            self.presentViewController(picker, animated: true, completion: {
                () -> Void in
            })
        }else{
            print("读取相册错误")
        }
    }
    @IBAction func goOutBtnAction(sender: AnyObject) {
        //返回登陆页
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        self.view.window?.rootViewController = mainStoryboard.instantiateViewControllerWithIdentifier("signInNavViewController")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("passWord")
        
//        let signinVc = SignInViewController()
//        presentViewController(UINavigationController(rootViewController: signinVc), animated: true, completion: nil)
//        NSUserDefaults.standardUserDefaults().removeObjectForKey("passWord")
    }
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
        
        loginOut.layer.borderWidth = 1
        loginOut.layer.borderColor = UIColor.orangeColor().CGColor
    }
    
    
    //选择图片成功后代理
    func imagePickerController(picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        //获取选择的原图
        let pickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        //等比例压缩图片大小／并剪切为圆形
        let width = 96 * UIScreen.mainScreen().scale
        let height = 96 * UIScreen.mainScreen().scale
        let pig = pickedImage.resize(CGSize(width: width, height: height))
        let pigc = pig?.roundCornersToCircle()
        
        //将选择的图片保存到Document目录下
        let fileManager = NSFileManager.defaultManager()
        let rootPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,
                                                           .UserDomainMask, true)[0] as String
        let filePath = "\(rootPath)/news.png"
        let imageData = UIImageJPEGRepresentation(pigc!, 1.0)
        fileManager.createFileAtPath(filePath, contents: imageData, attributes: nil)
        
        //上传图片
        if (fileManager.fileExistsAtPath(filePath)){
            //取得NSURL
            let imageNSURL:NSURL = NSURL.init(fileURLWithPath: filePath)
            self.userAvatar.setImage(UIImage(contentsOfFile:filePath)?.roundCornersToCircle(border: 10, color: UIColor.clearColor()), forState: .Normal)
            
//            print(imageData)
            
            let token:String = NSUserDefaults.standardUserDefaults().valueForKey("userToken") as! String
            let phone:String = NSUserDefaults.standardUserDefaults().valueForKey("userphone") as! String
            
            let headers = ["Accept":"application/json",
                            "X-User-Phone": phone,
                            "X-User-Token": token]
            
            Alamofire.upload(.PUT, "http://220.163.125.158:8081/user_info",
                             // define your headers here
                headers: headers,
                multipartFormData: { multipartFormData in
                    
                    // import image to request
                    if let imageData = UIImageJPEGRepresentation(pigc!, 1.0) {
                        multipartFormData.appendBodyPart(data: imageData, name: "user_info[avatar_attributes][photo]", fileName: "news.png", mimeType: "image/png")
                    }
                }, // you can customise Threshold if you wish. This is the alamofire's default value
                encodingMemoryThreshold: Manager.MultipartFormDataEncodingMemoryThreshold,
                encodingCompletion: { encodingResult in
                    switch encodingResult {
                    case .Success(let upload, _, _):
                        upload.responseJSON { response in
                            print("++++++++++++++++++++++++")
                            debugPrint(response)
                        }
                    case .Failure(let encodingError):
                        print("============================")
                        print(encodingError)
                    }
            })

        }
        
        //图片控制器退出
        picker.dismissViewControllerAnimated(true, completion:nil)
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
