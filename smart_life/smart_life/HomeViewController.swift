//
//  HomeViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/6/13.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, CirCleViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var circleView: CirCleView!
    

    @IBOutlet var collectionView: UICollectionView!
    
    let wd = UIScreen.mainScreen().bounds.size.width //屏幕宽度
    
    let colletionCell :Int=2//几列
    
    var hArr : [CGFloat] = [250,200,200,300,200,250,320,220]//数组存储不同高度
    
    /********************************** System Methods *****************************************/
    //MARK:- System Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        
        collectionView.dataSource = self
        
        collectionView.showsVerticalScrollIndicator = false
        
        self.view.addSubview(collectionView)

        self.automaticallyAdjustsScrollViewInsets = false
        
        let imageArray: [UIImage!] = [UIImage(named: "banner1.png"), UIImage(named: "banner2.png"), UIImage(named: "banner3.png")]
        
        self.circleView = CirCleView(frame: CGRectMake(0, 0, self.view.frame.size.width, 220), imageArray: imageArray)
        
        circleView.backgroundColor = UIColor.orangeColor()
        
        circleView.delegate = self
        
        self.view.addSubview(circleView)
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
    
    
    override func viewWillAppear(animated:Bool) {
    
        collectionView.reloadData()
    
    }
    
    func collectionView(collectionView:UICollectionView, cellForItemAtIndexPath indexPath:NSIndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        
        cell.backgroundColor=UIColor.blueColor()
        
        let remainder :Int = indexPath.row%colletionCell
        
        let currentRow :Int = indexPath.row/colletionCell
        
        let currentHeight :CGFloat=hArr[indexPath.row]
        
        let positonX = CGFloat( (Int(wd)/colletionCell-8) * remainder + 5*(remainder+1) )
        
        var positionY = CGFloat((currentRow+1)*5)
        
        for i in 0..<currentRow{
            
            let position = remainder + i*colletionCell
            
            positionY += hArr[position]
            
        }
        
        cell.frame=CGRectMake(positonX, positionY,CGFloat(Int(wd)/colletionCell-8),currentHeight) //重新定义cell位置、宽高
        
//        var model = GoodsModel()
//        model = dataArr[indexPath.row] as! GoodsModel
//        let url : NSURL = NSURL(string: model.image_url as String)!
//        cell.imgView!.hnk_setImageFromURL(url)
//        cell.layer.borderWidth = 0.3;
//        cell.layer.borderColor = UIColor.lightGrayColor().CGColor
//        cell.titleLabel!.text = model.short_name
//        cell.priceLabel!.text = "￥"+model.p_price
//        cell.readLabel!.text = "💗"+model.like_count
        
        return cell
      
    }
    
    func numberOfSectionsInCollectionView(collectionView:UICollectionView) ->Int{
    
        //必加这句否则refresh完崩溃
    
        collectionView.collectionViewLayout.invalidateLayout()
    
        return 1
    
    }
    
    func collectionView(collectionView:UICollectionView, numberOfItemsInSection section:Int) ->Int{
    
        return hArr.count
    
    }
    
    func collectionView(collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAtIndexPath indexPath:NSIndexPath) ->CGSize{
    
//        let rheight :CGFloat=CGFloat(80)
//    
//        hArr.append(rheight)
    
        return CGSizeMake(wd/CGFloat(colletionCell) - 8, hArr[indexPath.row])
    
    }
    
    func collectionView(collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, insetForSectionAtIndex section:Int) ->UIEdgeInsets{
    
        return UIEdgeInsetsMake(0,0,10,1)
    
    }

       /***************************** End & ReceiveMe Methods ************************************/
    //MARK:- End Methods
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

