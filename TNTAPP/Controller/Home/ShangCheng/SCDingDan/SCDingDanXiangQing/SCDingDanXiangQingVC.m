//
//  SCDingDanXiangQingVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/14.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "SCDingDanXiangQingVC.h"
#import "SCGouWuCheCVCell.h"
#import "SCXiangQingVC.h"
#import "SCDingDanCell.h"
#import "SCDingDanWuLiuVC.h"


@interface SCDingDanXiangQingVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>
{
    UIScrollView * _zhengscrollview;

    UITableView * _sptableview;

    UICollectionView * _collectionView;

}

@end

@implementation SCDingDanXiangQingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    
    
    [self zdydhl];
    
    [self zdyUI];
    
}


#pragma mark - 自定义导航栏
-(void)zdydhl
{
    UIView * daohan = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 64)];
    daohan.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [self.view addSubview:daohan];
    
    
    UIButton * fanhueibtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 30, 25, 25)];
    [fanhueibtn setImage:[UIImage imageNamed:@"fanhuei"] forState:UIControlStateNormal];
    [fanhueibtn addTarget:self action:@selector(fanhuei) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:fanhueibtn];
    
    
    
    UILabel * biaotinglabel =[[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2-50, 20, 100, 44)];
    biaotinglabel.text = @"订单详情";
    biaotinglabel.font =[UIFont systemFontOfSize:18];
    biaotinglabel.textAlignment = NSTextAlignmentCenter;
    biaotinglabel.textColor = [UIColor whiteColor];
    [daohan addSubview:biaotinglabel];
    
    
    UIButton * scddbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-85, 22, 80, 40)];
    [scddbtn setTitle:@"删除订单" forState:UIControlStateNormal];
    scddbtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [scddbtn addTarget:self action:@selector(sanchuclick) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:scddbtn];

    
}

#pragma mark - 自定义界面
-(void)zdyUI
{
    //创建scrollview
    _zhengscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64)];
    _zhengscrollview.showsHorizontalScrollIndicator = NO;
    _zhengscrollview.showsVerticalScrollIndicator = NO;
    _zhengscrollview.bounces = NO;
    [self.view addSubview:_zhengscrollview];

    //************海报**********************
    UIImage * hbimg = [UIImage imageNamed:@"mall_dingdanxiangqing_banner"];
    
    UIImageView * haibaoimgv= [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, hbimg.size.width/APPwidth*hbimg.size.height)];
    haibaoimgv.image = hbimg;
    [_zhengscrollview addSubview:haibaoimgv];
    
    
    //************物流**********************
    UIView * wuliuview = [[UIView alloc] initWithFrame:CGRectMake(0, haibaoimgv.frame.origin.y+haibaoimgv.frame.size.height+10, APPwidth, 65)];
    wuliuview.backgroundColor = [UIColor whiteColor];
    [_zhengscrollview addSubview:wuliuview];
    
    UIImageView * wuliuimgv= [[UIImageView alloc] initWithFrame:CGRectMake(10, 65/2-10, 20, 20)];
    wuliuimgv.image = [UIImage imageNamed:@"mall_dingdanxiangqing_car"];
    [wuliuview addSubview:wuliuimgv];
    
    
    UILabel * wuliulabel1 = [[UILabel alloc] initWithFrame:CGRectMake(wuliuimgv.frame.origin.x+wuliuimgv.frame.size.width+15, 10, APPwidth-20-wuliuimgv.frame.origin.x-wuliuimgv.frame.size.width, 20)];
    wuliulabel1.text = @"广州市[广州广园站一分部],拍照签收,已签收";
    wuliulabel1.textColor = [UIColor colorWithRed:0/255.0 green:199/255.0 blue:123/255.0 alpha:1.0];
    wuliulabel1.font = [UIFont systemFontOfSize:14];
    [wuliuview addSubview:wuliulabel1];
    
    
    UILabel * wuliulabel2 = [[UILabel alloc] initWithFrame:CGRectMake(wuliulabel1.frame.origin.x, 35, wuliulabel1.frame.size.width, 20)];
    wuliulabel2.text = @"2017-03-21  16:14";
    wuliulabel2.textColor = [UIColor colorWithRed:0/255.0 green:199/255.0 blue:123/255.0 alpha:1.0];
    wuliulabel2.font = [UIFont systemFontOfSize:14];
    [wuliuview addSubview:wuliulabel2];
    
    
    UIButton * wuliubtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, APPwidth, wuliuview.frame.size.height)];
    [wuliubtn addTarget:self action:@selector(wuliu) forControlEvents:1<<6];
    [wuliuview addSubview:wuliubtn];
    
    //************收货地址**********************
    UIView * dizhiview = [[UIView alloc] initWithFrame:CGRectMake(0, wuliuview.frame.origin.y+wuliuview.frame.size.height+10, APPwidth, 65)];
    dizhiview.backgroundColor = [UIColor whiteColor];
    [_zhengscrollview addSubview:dizhiview];

    UIButton * dizhiimgv= [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 25, 25)];
    [dizhiimgv setImage:[UIImage imageNamed:@"mall_dingdanxiangqing_dingwei"] forState:0];
    [dizhiview addSubview:dizhiimgv];
    

    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(dizhiimgv.frame.origin.x+dizhiimgv.frame.size.width+10, 10, APPwidth-20-dizhiimgv.frame.origin.x-dizhiimgv.frame.size.width, 20)];
    label1.text = @"收货人：某某某   15548798562";
    label1.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
    label1.font = [UIFont systemFontOfSize:16];
    [dizhiview addSubview:label1];
    
    
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(label1.frame.origin.x, 35, label1.frame.size.width, 20)];
    label2.text = @"广东省广州市南沙区双山大道中大城4栋";
    label2.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    label2.font = [UIFont systemFontOfSize:14];
    [dizhiview addSubview:label2];
    
    
    //*************店招********************
    UIView * dianzhaoview = [[UIView alloc] initWithFrame:CGRectMake(0, dizhiview.frame.origin.y+dizhiview.frame.size.height+10, APPwidth, 50)];
    dianzhaoview.backgroundColor = [UIColor whiteColor];
    [_zhengscrollview addSubview:dianzhaoview];
    
    UIImageView * dianlogoimgv  =[[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
    dianlogoimgv.backgroundColor = [UIColor orangeColor];
    [dianzhaoview addSubview:dianlogoimgv];
    
    UILabel * _dianminglabel = [[UILabel alloc] initWithFrame:CGRectMake(dianlogoimgv.frame.origin.x+40, 0, 150, 50)];
    _dianminglabel.text = @"呼来商城";
    _dianminglabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
    _dianminglabel.textAlignment = 0;
    _dianminglabel.font = [UIFont systemFontOfSize:15];
    [dianzhaoview addSubview:_dianminglabel];
    
    
    UIButton * kefubtn = [[UIButton alloc] initWithFrame:CGRectMake(dianzhaoview.frame.size.width-100, 0, 90, 50)];
    [kefubtn setTitle:@"客服" forState:0];
    [kefubtn setTitleColor:[UIColor colorWithRed:153/255.0 green:153/255.0  blue:153/255.0  alpha:1.0] forState:0];
    kefubtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [kefubtn setImage:[UIImage imageNamed:@"mall_dingdanxiangqing_kefu"] forState:0];
    kefubtn.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [dianzhaoview addSubview:kefubtn];
    

    //************商品信息**********************
    _sptableview = [[UITableView alloc] initWithFrame:CGRectMake(0, dianzhaoview.frame.origin.y+dianzhaoview.frame.size.height+10, APPwidth, 120*2)];
    _sptableview.delegate = self;
    _sptableview.dataSource = self;
    _sptableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_zhengscrollview addSubview:_sptableview];
    
    //*************订单信息********************
    UIView * dingdanxxview = [[UIView alloc] initWithFrame:CGRectMake(0, _sptableview.frame.origin.y+_sptableview.frame.size.height, APPwidth, 200)];
    dingdanxxview.backgroundColor = [UIColor whiteColor];
    [_zhengscrollview addSubview:dingdanxxview];
    
    NSArray * array1 = @[@"快递运费：",@"价格合计："];
    NSArray * array2 = @[@"包邮",@"¥99.00"];
    
    for (int i = 0; i < array1.count; i++) {
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 40*i, APPwidth/2-10, 40)];
        label1.text = array1[i];
        label1.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0  blue:102/255.0  alpha:1.0];
        label1.textAlignment = 0;
        label1.font = [UIFont systemFontOfSize:18];
        [dingdanxxview addSubview:label1];
        

        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth/2, 40*i, APPwidth/2-10, 40)];
        label2.text = array2[i];
        label2.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
        label2.textAlignment = 2;
        label2.font = [UIFont systemFontOfSize:18];
        [dingdanxxview addSubview:label2];
        
        if (i == 1) {
         
            label2.font = [UIFont systemFontOfSize:20];

            NSMutableAttributedString *jiagestr = [[NSMutableAttributedString alloc] initWithString:@"¥ 99.00"];
            [jiagestr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, 1)];
            [jiagestr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(jiagestr.length-3, 3)];
            label2.attributedText = jiagestr;
            
            
        }
        UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(10, 40*i+40, APPwidth-20, 1)];
        xian.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
        [dingdanxxview addSubview:xian];
        
    }

    NSArray * array3 = @[@"订单编号：201703151443125",@"下单时间：2017-03-15  14:52:02",@"付款时间：2017-03-15  14:58:23",@"优行币：U币抵扣10元"];
    for (int i = 0; i < array3.count; i++) {
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 25*i+90, APPwidth-20, 25)];
        label1.text = array3[i];
        label1.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        label1.textAlignment = 0;
        label1.font = [UIFont systemFontOfSize:14];
        [dingdanxxview addSubview:label1];
        

    }
    

    
    //*************优惠券********************
    UIView * youhueiquanview = [[UIView alloc] initWithFrame:CGRectMake(0, dingdanxxview.frame.origin.y+dingdanxxview.frame.size.height+10, APPwidth, 50)];
    youhueiquanview.backgroundColor = [UIColor whiteColor];
    [_zhengscrollview addSubview:youhueiquanview];
    
    UILabel * youhueiquanlabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, APPwidth-20, 50)];
    youhueiquanlabel.text = @"未使用商城优惠券";
    youhueiquanlabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    youhueiquanlabel.textAlignment = 0;
    youhueiquanlabel.font = [UIFont systemFontOfSize:15];
    [youhueiquanview addSubview:youhueiquanlabel];
    

    

    //************猜你喜欢头部**********************
    UIView * cnxhview = [[UIView alloc] initWithFrame:CGRectMake(0, youhueiquanview.frame.origin.y+youhueiquanview.frame.size.height+10, APPwidth, 50)];
    cnxhview.backgroundColor = [UIColor whiteColor];
    [_zhengscrollview addSubview:cnxhview];
    
    UILabel * label =[[UILabel alloc] initWithFrame:CGRectMake(10, 0, APPwidth-20, 50)];
    label.font =[UIFont systemFontOfSize:18];
    label.textAlignment = 0;
    label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
    [cnxhview addSubview:label];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"猜你喜欢  RECOMMEND"];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(6, 9)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] range:NSMakeRange(6,9)];
    label.attributedText = str;


    //*****************推荐******************
    float cvx = (APPwidth-30)/2;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(cvx, cvx+85);
    layout.sectionInset = UIEdgeInsetsMake(0, 8, 8, 8);
    layout.minimumInteritemSpacing = 8;
    layout.minimumLineSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    
    //collectionView
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, cnxhview.frame.origin.y+cnxhview.frame.size.height, APPwidth, (cvx+85+10)*5+50) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_zhengscrollview addSubview:_collectionView];
    
    //注册collectionView
    [_collectionView registerClass:[SCGouWuCheCVCell class] forCellWithReuseIdentifier:@"Cell"];
    
    
    _zhengscrollview.contentSize = CGSizeMake(0, _collectionView.frame.origin.y+_collectionView.frame.size.height);
    
    

    
}



#pragma mark - cell
//一组多少条
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 2;
    
}


//cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * str = @"cell";
    SCDingDanCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        
        cell = [[SCDingDanCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    
    
    cell.datu.image = [UIImage imageNamed:@"shouyexiaotu1"];
    
    cell.biaoting.text = @"自然堂 美白补水3件套";
    cell.biaoting.textAlignment = 0;
    cell.biaoting.font = [UIFont systemFontOfSize:15];
    cell.biaoting.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
    
    
    cell.gueige.text = @"颜色分类：补水6件套";
    cell.gueige.textAlignment = 0;
    cell.gueige.font = [UIFont systemFontOfSize:14];
    cell.gueige.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    
    
//    cell.biaoqian.text = @"七天包换";
//    cell.biaoqian.textAlignment = 1;
//    cell.biaoqian.font = [UIFont systemFontOfSize:13];
//    cell.biaoqian.textColor = [UIColor whiteColor];
//    cell.biaoqian.backgroundColor = [UIColor colorWithRed:255/255.0 green:30/255.0 blue:76/255.0 alpha:1.0];
    
    
    cell.jiage.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    cell.jiage.font = [UIFont systemFontOfSize:20];
    cell.jiage.textAlignment = 2;
    NSMutableAttributedString *jiagestr = [[NSMutableAttributedString alloc] initWithString:@"¥ 99.00"];
    [jiagestr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, 1)];
    [jiagestr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(jiagestr.length-3, 3)];
    cell.jiage.attributedText = jiagestr;
    
    
    
    cell.yuanjia.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    cell.yuanjia.font = [UIFont systemFontOfSize:12];
    cell.yuanjia.textAlignment = 2;
    NSString * yjtr = @"¥199.00";
    NSDictionary *yjDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *yjStr2 = [[NSMutableAttributedString alloc]initWithString:yjtr attributes:yjDic];
    cell.yuanjia.attributedText = yjStr2;
    
    
    
    cell.shuliang.font = [UIFont systemFontOfSize:18];
    cell.shuliang.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    cell.shuliang.textAlignment = 2;
    NSMutableAttributedString *shulstr = [[NSMutableAttributedString alloc] initWithString:@"x2"];
    [shulstr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, 1)];
    cell.shuliang.attributedText = shulstr;
    

    
    cell.xian.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}


//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}


//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
    
}




#pragma mark -  UICollectionView
//每个分区有多少个Item
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 10;
    
}


//Item的显示内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SCGouWuCheCVCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    
    
    cell.tupian.image = [UIImage imageNamed:@"shouyexiaotu1"];

    cell.biaoting.text = @"商品名称商品名称商品名称商品名称商品";
    cell.biaoting.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
    cell.biaoting.numberOfLines = 2;
    cell.biaoting.font = [UIFont systemFontOfSize:14];
    
    
    cell.jiage.text = @"¥99.00";
    cell.jiage.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
    cell.jiage.font = [UIFont systemFontOfSize:18];
    
    
    cell.gwc.image = [UIImage imageNamed:@"Mall_shouye_cart"];

    cell.dise.backgroundColor = [UIColor whiteColor];
    
    return cell;
}




-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SCXiangQingVC * scxq = [[SCXiangQingVC alloc] init];
    [self.navigationController pushViewController:scxq animated:YES];
}





#pragma mark - 查看物流
-(void)wuliu
{
    SCDingDanWuLiuVC * scddwl = [[SCDingDanWuLiuVC alloc] init];
    [self.navigationController pushViewController:scddwl animated:YES];
}






#pragma mark - 删除订单
-(void)sanchuclick
{
    
}

#pragma mark - 返回
-(void)fanhuei
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    ((MyTabBar *)self.tabBarController).tabBarView.hidden = YES;
    
}


-(void)viewWillDisappear:(BOOL)animated
{
    ((MyTabBar *)self.tabBarController).tabBarView.hidden = NO;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
