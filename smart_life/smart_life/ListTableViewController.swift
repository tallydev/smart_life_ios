//
//  ListTableViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/6/21.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit
import Alamofire

class ListTableViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //选取相册
    @IBAction func fromAlbum(sender: AnyObject) {
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
    
    //选择图片成功后代理
    func imagePickerController(picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        //获取选择的原图
        let pickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //将选择的图片保存到Document目录下
        let fileManager = NSFileManager.defaultManager()
        let rootPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,
                                                           .UserDomainMask, true)[0] as String
        let filePath = "\(rootPath)/pickedimage.jpg"
        let imageData = UIImageJPEGRepresentation(pickedImage, 1.0)
        fileManager.createFileAtPath(filePath, contents: imageData, attributes: nil)
        
        //上传图片
        if (fileManager.fileExistsAtPath(filePath)){
            //取得NSURL
            let imageNSURL:NSURL = NSURL.init(fileURLWithPath: filePath)
            
            //使用Alamofire上传
            Alamofire.upload(.POST, "http://www.hangge.com/upload.php", file: imageNSURL)
                .responseString { response in
                    print("Success: \(response.result.isSuccess)")
                    print("Response String: \(response.result.value)")
            }
        }
        
        //图片控制器退出
        picker.dismissViewControllerAnimated(true, completion:nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}