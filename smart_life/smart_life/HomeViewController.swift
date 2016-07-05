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
    
    let model = generateRandomData()
    var storedOffsets = [Int: CGFloat]()

    @IBOutlet var collectionView: UICollectionView!
    
    let wd = UIScreen.mainScreen().bounds.size.width //屏幕宽度
    
    
    
    let colletionCell :Int=2//几列
    
    var hArr : [CGFloat] = [230,180,180,280,180,230,300,200]//数组存储不同高度
    
    let courses = [
        ["name":"— 智慧健康 —","pic":"banner2.png"],
        ["name":"— 健身达人 —","pic":"banner3.png"],
        ["name":"— 社区活动 —","pic":"banner4.png"],
        ["name":"— 市政大厅 —","pic":"banner5.png"],
        ["name":"— 智慧家居 —","pic":"banner6.png"],
        ["name":"— 社区IT —","pic":"banner7.png"],
        ["name":"— 新品上市 —","pic":"banner8.png"],
        ["name":"— 限量销售 —","pic":"banner9.png"]
    ]
    
let btns = [
    [
        ["name":"预约体检","pic":"banner2.png"],
        ["name":"健康报告","pic":"banner2.png"],
        ["name":"预约专家","pic":"banner2.png"]
    ],
    [
        ["name":"更多数据","pic":"banner2.png"]
    ],
    [
        ["name":"活动详情","pic":"banner2.png"]
    ],
    [
        ["name":"天气查询","pic":"banner2.png"],
        ["name":"违章查询","pic":"banner2.png"],
        ["name":"公积金","pic":"banner2.png"],
        ["name":"医保卡","pic":"banner2.png"],
        ["name":"预约办证","pic":"banner2.png"],
        ["name":"更多查询","pic":"banner2.png"]
    ],
    [
        ["name":"远程控制","pic":"banner2.png"],
        ["name":"电子猫眼","pic":"banner2.png"]
    ],
    [
        ["name":"学堂","pic":"banner2.png"],
        ["name":"在线冲印","pic":"banner2.png"],
        ["name":"服务","pic":"banner2.png"]
    ],
    [
        ["name":"我要预约","pic":"banner2.png"]
    ],
    [
        ["name":"更多臻品","pic":"banner2.png"]
    ]
]
    
//    let controller = SportTabViewController(nibName:"SportTabViewController", bundle:nil)
//    var stepview = NSBundle.mainBundle().loadNibNamed("SportTabViewController", owner: nil, options: nil)[0]
    
    /********************************** System Methods *****************************************/
    //MARK:- System Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        
        collectionView.dataSource = self
        
        collectionView.showsVerticalScrollIndicator = false
        
        //创建一个重用的单元格
        collectionView.registerNib(UINib(nibName:"HomeTabCollectionViewCell", bundle:nil),
                                    forCellWithReuseIdentifier:"cell")
        
        self.view.addSubview(collectionView)

        self.automaticallyAdjustsScrollViewInsets = false
        
        let imageArray: [UIImage!] = [UIImage(named: "banner1.png"), UIImage(named: "banner2.png"), UIImage(named: "banner3.png")]
        
        self.circleView = CirCleView(frame: CGRectMake(0, 0, self.view.frame.size.width, 220), imageArray: imageArray)
        
        circleView.backgroundColor = UIColor.orangeColor()
        
        circleView.delegate = self
        
        self.collectionView.addSubview(circleView)
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
        // 布局UI
//        layoutUI()
        collectionView.reloadData()
    
    }
    
    func getView() -> UIView {
        return NSBundle.mainBundle().loadNibNamed("homeTabBtnCollectionViewCell", owner: nil, options: nil)[0] as! UIView
    }
    
    func collectionView(collectionView:UICollectionView, cellForItemAtIndexPath indexPath:NSIndexPath) -> UICollectionViewCell{
        
       
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! HomeTabCollectionViewCell
            
            let remainder :Int = indexPath.row%colletionCell
            
            let currentRow :Int = indexPath.row/colletionCell
            
            let currentHeight :CGFloat=hArr[indexPath.row]
            
            let positonX = CGFloat( (Int(wd)/colletionCell-8) * remainder + 5*(remainder+1) )
            
            var positionY = CGFloat((currentRow+1)*5) + 220
            
            for i in 0..<currentRow{
                
                let position = remainder + i*colletionCell
                
                positionY += hArr[position]
                
            }
            
            cell.backgroundColor=UIColor.whiteColor()
            cell.frame=CGRectMake(positonX, positionY,CGFloat(Int(wd)/colletionCell-8),currentHeight) //重新定义cell位置、宽高
            let item = courses[indexPath.row]
            cell.homeTabLabel.text = item["name"]
            cell.homeTabImage.image = UIImage(named:item["pic"]!)
      
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
//        随机改变cell大小的高度
//        let rheight :CGFloat=CGFloat(80+ (arc4random() %150))
//        hArr.append(rheight)
    
        return CGSizeMake(wd/CGFloat(colletionCell) - 10, hArr[indexPath.row])
    
    }
    
    func collectionView(collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, insetForSectionAtIndex section:Int) ->UIEdgeInsets{
    
        return UIEdgeInsetsMake(210,0,-145,1)
    
    }
    
          /***************************** End & ReceiveMe Methods ************************************/
    //MARK:- End Methods
}
