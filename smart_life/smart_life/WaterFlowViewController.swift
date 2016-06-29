//
//protocol WaterFlowViewLayoutDelegate:NSObjectProtocol
//{
//    //collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath)
//    ///width是瀑布流每列的宽度
//    func waterFlowViewLayout(waterFlowViewLayout:WaterFlowViewLayout,heightForWidth:CGFloat,atIndextPath:NSIndexPath)->CGFloat
//}
//
//
//
//
//
//
//class WaterFlowViewController: UICollectionViewController,WaterFlowViewLayoutDelegate {
//    
//    let ReuseIdentifier = "cell"
//    
//    let courses = [
//        ["name":"— 智慧健康 —","pic":"banner2.png"],
//        ["name":"— 健身达人 —","pic":"banner3.png"],
//        ["name":"— 社区活动 —","pic":"banner4.png"],
//        ["name":"— 市政大厅 —","pic":"banner5.png"],
//        ["name":"— 智慧家居 —","pic":"banner6.png"],
//        ["name":"— 社区IT —","pic":"banner7.png"],
//        ["name":"— 新品上市 —","pic":"banner8.png"],
//        ["name":"— 限量销售 —","pic":"banner9.png"]
//    ]
//
//    
//    
//    let layout = WaterFlowViewLayout()
//    
//    init(){
//        super.init(collectionViewLayout: layout)
//        
//    }
//    
//    override func viewDidLoad() {
//        
//        super.viewDidLoad()
//        collectionView?.backgroundColor = UIColor.whiteColor()
//        collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: ReuseIdentifier)
//        layout.delegate = self
//        
//    }
//    
//    func waterFlowViewLayout(waterFlowViewLayout: WaterFlowViewLayout, heightForWidth: CGFloat, atIndextPath: NSIndexPath) -> CGFloat {
//        return CGFloat(100 + arc4random_uniform(50))
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    
//    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return courses.count
//    }
//    
//    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as!HomeTabCollectionViewCell
//        
//        let item = courses[indexPath.row]
//        cell.homeTabLabel.text = item["name"]
//        cell.homeTabImage.image = UIImage(named:item["pic"]!)
//        
//        return cell
//    }
//    
//}
//
//
//
//
//
//
//
//
//
//
//class WaterFlowViewLayout: UICollectionViewLayout {
//    
//    weak var delegate:WaterFlowViewLayoutDelegate?
//    
//    ///所有cell的布局属性
//    var layoutAttributes = [UICollectionViewLayoutAttributes]()
//    
//    ///使用一个字典记录每列的最大Y值
//    var maxYDict = [Int:CGFloat]()
//    
//    static var Margin:CGFloat = 8
//    
//    ///瀑布流四周的间距
//    var sectionInsert = UIEdgeInsets(top: Margin, left: Margin, bottom: Margin, right: Margin)
//    //列间距
//    var columnMargin:CGFloat = Margin
//    
//    //行间距
//    var rowMargin:CGFloat = Margin
//    
//    ///瀑布流列数
//    var column = 4
//    
//    var maxY:CGFloat = 0
//    
//    var columnWidth:CGFloat = 0
//    ///prepareLayout会在调用collectionView.reloadData()
//    override func prepareLayout() {
//        //设置布局
//        //需要清空字典里面的值
//        for key in 0..<column
//        {
//            maxYDict[key] = 0
//        }
//        //清空之前的布局属性
//        layoutAttributes.removeAll()
//        //清空最大列的Y值
//        maxY = 0
//        
//        ///清空列宽
//        columnWidth = 0
//        
//        //计算每列的宽度，需要在布局之前算好
//        columnWidth = (UIScreen.mainScreen().bounds.width - sectionInsert.left - sectionInsert.right - (CGFloat(column) - 1)*columnMargin)/CGFloat(column)
//        
//        let number = collectionView?.numberOfItemsInSection(0) ?? 0
//        
//        for i in 0..<number
//        {
//            //布局每一个cell的frame
//            let layoutAttr = layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: i, inSection: 0))!
//            layoutAttributes.append(layoutAttr)
//        }
//        
//        calcMaxY()
//        
//    }
//    func calcMaxY(){
//        //获取最大这一列的Y
//        //默认第0列最长
//        var maxYCoulumn = 0
//        //for 循环比较，获取最长的这列
//        for (key,value) in maxYDict
//        {
//            if value > maxYDict[maxYCoulumn]{
//                //key这列的Y值是最大的
//                maxYCoulumn = key
//            }
//        }
//        //获取到Y值最大的这一列
//        maxY = maxYDict[maxYCoulumn]! + sectionInsert.bottom
//        
//    }
//    //返回collectionViewContentSize 大小
//    override  func collectionViewContentSize() -> CGSize {
//        
//        return CGSize(width: UIScreen.mainScreen().bounds.width, height: maxY)
//        
//    }
//    
//    
//    
//    // 返回每一个cell的布局属性(layoutAttributes)
//    //  UICollectionViewLayoutAttributes: 1.cell的frame 2.indexPath
//    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes?
//    {
//        assert(delegate != nil,"瀑布流必须实现代理来返回cell的高度")
//        
//        let height = delegate!.waterFlowViewLayout(self, heightForWidth: columnWidth, atIndextPath: indexPath)
//        // 找到最短的那一列,去maxYDict字典中找
//        
//        // 最短的这一列
//        var minYColumn = 0
//        
//        //通过for循环去和其他列比较
//        for(key, value) in maxYDict {
//            
//            if value < maxYDict[minYColumn]
//            {
//                minYColumn = key
//                
//            }
//        }
//        
//        // minYColumn 就是短的那一列
//        let x = sectionInsert.left + CGFloat(minYColumn) * (columnWidth + columnMargin)
//        //最短这列的Y值 + 行间距
//        let y = maxYDict[minYColumn]! + rowMargin
//        //设置cell的frame
//        let frame = CGRect(x: x, y: y, width: columnWidth, height: height)
//        //更新最短这列的最大Y值
//        maxYDict[minYColumn] = CGRectGetMaxY(frame)
//        //创建每个cell对应的布局属性
//        let layoutAttr = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
//        layoutAttr.frame = frame
//        return layoutAttr
//    }
//    
//    //预加载下一页数据
//    override func layoutAttributesForElementsInRect(rect:CGRect) -> [UICollectionViewLayoutAttributes]{
//        return layoutAttributes
//    }
//    
//    
//}