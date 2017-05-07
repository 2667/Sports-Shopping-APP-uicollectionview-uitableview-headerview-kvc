//
//  SCGouWuCheVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/3/10.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "SCGouWuCheVC.h"
#import "SCGouWuCheCell.h"
#import "SCGouWuCheCVCell.h"
#import "SCXiangQingVC.h"
#import "SCTJDDVC.h"
#import "SCGouWuCheModel.h"
#import "SCXXVC.h"


@interface SCGouWuCheVC ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
{
    
    UIScrollView * _zhengscrollview;

    UITableView * _tableview;
    NSMutableArray * _gwcshujuyuan;
    
    UICollectionView * _collectionView;

    UIButton * _quanxuanbtn;
    BOOL _quanxuanbool;
    
    int _gwctag;
    int _gwcjiantag;
    int _gwcjiatag;

    
    int _yixuangeshu;
    NSMutableArray * _yixuansparray;
    
    NSString * _bianjizhuantai;
    
    
    
    //*******规格******
    UIView * _gueigeview;
    UIView * _ggview;
    UIButton * _qdbtn;
    UILabel * _shulianlabel;
    int _shuliang;
    NSArray * _yansearray;
    NSArray * _chimaarray;
    UILabel * _gueigelabel;

    //*******优惠券******
    UIView * _youhueiquanview;
    UIView * _yhqview;
}

@end

@implementation SCGouWuCheVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    
    _gwcshujuyuan = [[NSMutableArray alloc] init];
    
    _yixuansparray = [[NSMutableArray alloc] init];
    
    _shuliang = 1;
    
    _yixuangeshu = 0;
    
    _bianjizhuantai = @"编辑";
    
    _quanxuanbool = YES;
    
    _gwctag = 61000;
    
    _gwcjiantag = 62000;
    
    _gwcjiatag = 63000;

    
    [self zdydhl];
    
    [self zdyUI];
    
    [self zdygueigeui];
    
    [self zdyyouhueiquanui];
    
    
    for(int i = 0;i<10;i++)
    {
 
        SCGouWuCheModel * model = [[SCGouWuCheModel alloc] init];
        model.biaoting = @"商品标题商品标题商品标题";
        model.gueige = @"规格：补水6件套";
        model.shuliang = @"1";
        model.jiage = @"¥99.00";
        model.yuanjia = @"¥199.00";

        [_gwcshujuyuan addObject:model];
        
    }

    
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
    biaotinglabel.text = @"购物车(6)";
    biaotinglabel.font =[UIFont systemFontOfSize:18];
    biaotinglabel.textAlignment = NSTextAlignmentCenter;
    biaotinglabel.textColor = [UIColor whiteColor];
    [daohan addSubview:biaotinglabel];
    
    
    UIButton *  bianjibtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-85, 22, 40, 40)];
    [bianjibtn setTitle:@"编辑" forState:UIControlStateNormal];
    bianjibtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [bianjibtn addTarget:self action:@selector(bianjiclick:) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:bianjibtn];
    
    
    UIButton *  xiaoxibtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-40, 27, 30, 30)];
    [xiaoxibtn setImage:[UIImage imageNamed:@"car-xinxi"] forState:0];
    [xiaoxibtn addTarget:self action:@selector(xiaoxiclick) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:xiaoxibtn];
    
}

#pragma mark - 自定义界面
-(void)zdyUI
{
    
    //创建scrollview
    _zhengscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64-60)];
    _zhengscrollview.showsHorizontalScrollIndicator = NO;
    _zhengscrollview.showsVerticalScrollIndicator = NO;
    _zhengscrollview.bounces = NO;
    [self.view addSubview:_zhengscrollview];
    
    
   
    //*****************购物车列表******************
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 120*10+50+100)];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_zhengscrollview addSubview:_tableview];

    
    //*****************购物车推荐******************
    float cvx = (APPwidth-30)/2;
    
    //先创建UICollectionViewFlowLayout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //修改item大小
    layout.itemSize = CGSizeMake(cvx, cvx+85);
    //上下左右偏移
    layout.sectionInset = UIEdgeInsetsMake(0, 8, 8, 8);
    //左右两个item的最小间距
    layout.minimumInteritemSpacing = 8;
    //上下两个item的最小间距
    layout.minimumLineSpacing = 10;
    //滚动的方向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    
    //分类collectionView
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, _tableview.frame.origin.y+_tableview.frame.size.height+30, APPwidth, (cvx+85+10)*5+50) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_zhengscrollview addSubview:_collectionView];
    
    //注册collectionView
    [_collectionView registerClass:[SCGouWuCheCVCell class] forCellWithReuseIdentifier:@"Cell"];
    
    



    _zhengscrollview.contentSize = CGSizeMake(0, _collectionView.frame.origin.y+_collectionView.frame.size.height);
    
    
    //*****************底部******************
    UIView * dibuview = [[UIView alloc] initWithFrame:CGRectMake(0, APPheight-60, APPwidth, 60)];
    dibuview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [self.view addSubview:dibuview];
    
    _quanxuanbtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, 100, 60)];
    [_quanxuanbtn setTitle:@"全选(0)" forState:0];
    [_quanxuanbtn setTitleColor:[UIColor whiteColor] forState:0];
    _quanxuanbtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_quanxuanbtn setImage:[UIImage imageNamed:@"mall_weixuanzhong"] forState:0];
    [_quanxuanbtn setImage:[UIImage imageNamed:@"mall_xuanzhong"] forState:UIControlStateSelected];
    _quanxuanbtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
    [_quanxuanbtn addTarget:self action:@selector(quanxuanclick:) forControlEvents:1<<6];
    [dibuview addSubview:_quanxuanbtn];
    
    
    
    UILabel * zongjialabel =[[UILabel alloc] initWithFrame:CGRectMake(_quanxuanbtn.frame.origin.x+_quanxuanbtn.frame.size.width, 5, APPwidth-_quanxuanbtn.frame.origin.x-_quanxuanbtn.frame.size.width-110, 30)];
    zongjialabel.font =[UIFont systemFontOfSize:18];
    zongjialabel.textAlignment = 2;
    zongjialabel.textColor = [UIColor whiteColor];
    [dibuview addSubview:zongjialabel];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"合计:¥198.00"];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(3, 1)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(str.length-2, 2)];
     [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(4, 3)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0] range:NSMakeRange(3,str.length-3)];//设置不同颜色
    zongjialabel.attributedText = str;

    
    UILabel * yuflabel =[[UILabel alloc] initWithFrame:CGRectMake(zongjialabel.frame.origin.x, 35, zongjialabel.frame.size.width, 20)];
    yuflabel.font =[UIFont systemFontOfSize:14];
    yuflabel.textAlignment = 2;
    yuflabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    yuflabel.text = @"(不含运费)";
    [dibuview addSubview:yuflabel];

    
    UIButton *  jiesuanbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-100, 0, 100, 60)];
    [jiesuanbtn setTitle:@"结算" forState:UIControlStateNormal];
    jiesuanbtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [jiesuanbtn addTarget:self action:@selector(jiesuanclick) forControlEvents:UIControlEventTouchUpInside];
    jiesuanbtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:30/255.0 blue:76/255.0 alpha:1.0];
    [dibuview addSubview:jiesuanbtn];
    
}



#pragma mark - 创建规格界面
-(void)zdygueigeui
{
    _gueigeview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    _gueigeview.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [self.view addSubview:_gueigeview];
    _gueigeview.hidden = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ycgueigeui)];
    [_gueigeview addGestureRecognizer:tap];
    
    
    
    _ggview = [[UIView alloc] initWithFrame:CGRectMake(0, APPheight+40, APPwidth, 400)];
    _ggview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_ggview];
    
    
    UIImageView * _zhutuimgv = [[UIImageView alloc] initWithFrame:CGRectMake(10, -40, 120, 120)];
    _zhutuimgv.backgroundColor = [UIColor orangeColor];
    _zhutuimgv.layer.borderWidth = 1;
    _zhutuimgv.layer.borderColor = [[UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0] CGColor];
    _zhutuimgv.layer.cornerRadius = 3;
    _zhutuimgv.layer.masksToBounds = YES;
    _zhutuimgv.image = [UIImage imageNamed:@"QQ20170206-135925"];
    [_ggview addSubview:_zhutuimgv];
    
    
    NSArray * arrya = @[@"¥99.00—¥156.00",@"U币最高可减免¥10.00",@"请选择：规格"];
    for (int i = 0; i < arrya.count; i++) {
        
        UILabel * label =[[UILabel alloc] initWithFrame:CGRectMake(_zhutuimgv.frame.origin.x+_zhutuimgv.frame.size.width+10, 10+25*i, APPwidth-_zhutuimgv.frame.size.width-50, 25)];
        label.text = arrya[i];
        label.textColor = [UIColor colorWithRed:255/255.0 green:0/255.0 blue:62/255.0 alpha:1.0];
        [_ggview addSubview:label];
        
        if (i == 0) {
            
            label.font = [UIFont fontWithName:@"FZDaHei-B02S" size:16];
            
        }
        else if (i == 1) {
            
            label.font = [UIFont systemFontOfSize:13];
        }
        else if (i == 2)
        {
            label.font = [UIFont systemFontOfSize:14];
            label.textColor = [UIColor colorWithRed:61/255.0 green:61/255.0 blue:61/255.0 alpha:1.0];
            
            _gueigelabel = label;
            
        }
        
        
    }
    
    
    UIButton * ycbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-40, 10, 30, 30)];
    [ycbtn setImage:[UIImage imageNamed:@"xiangqing-delete"] forState:0];
    [ycbtn addTarget:self action:@selector(ycgueigeui) forControlEvents:1<<6];
    [_ggview addSubview:ycbtn];
    
    
    UIView * xian1 = [[UIView alloc] initWithFrame:CGRectMake(10, _zhutuimgv.frame.origin.y+_zhutuimgv.frame.size.height+20, APPwidth-20, 1)];
    xian1.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    [_ggview addSubview:xian1];
    
    
    
    float gueigey = xian1.frame.origin.y+10;
    
    NSArray * array = @[@"套装分类",@"尺码分类",@"购买数量"];
    
    for (int j = 0; j < array.count; j++) {
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, gueigey, APPwidth-20, 30)];
        label1.text = array[j];
        label1.font = [UIFont systemFontOfSize:16];
        label1.textColor = [UIColor blackColor];
        [_ggview addSubview:label1];
        
        //*************套装分类*************
        if (j == 0) {
            
            
            float yansex = 10;
            float yansey = label1.frame.origin.y+30;
            _yansearray = @[@"补水保湿紧致肌肤",@"珍珠白四件套",@"珍珠白3件套",@"美白补水型",@"修复型"];
            int yansetag = 710000;
            
            for (int i = 0; i < _yansearray.count; i++) {
                
                
                UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(yansex, yansey, 40, 20)];
                label.text = _yansearray[i];
                label.font = [UIFont systemFontOfSize:13];
                label.textColor = [UIColor clearColor];
                [_ggview addSubview:label];
                [label sizeToFit];
                
                
                UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.size.width+10, label.frame.size.height+10)];
                [btn setTitle:_yansearray[i] forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0] forState:UIControlStateNormal];
                btn.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
                btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
                btn.layer.cornerRadius = 5;
                btn.layer.masksToBounds = YES;
                [btn addTarget:self action:@selector(yansexuanzhe:) forControlEvents:UIControlEventTouchUpInside];
                btn.tag = yansetag;
                btn.titleLabel.font = [UIFont systemFontOfSize:13];
                [_ggview addSubview:btn];
                
                
                
                if (btn.frame.origin.x+btn.frame.size.width>APPwidth-5) {
                    
                    CGRect fram = btn.frame;
                    fram.origin.y = btn.frame.origin.y+btn.frame.size.height+10;
                    fram.origin.x = 15;
                    btn.frame = fram;
                    
                    
                    yansey =  btn.frame.origin.y;
                    
                    
                }
                
                if (i == 0) {
                    
                    btn.backgroundColor = [UIColor orangeColor];
                    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    
                    _gueigelabel.text = [NSString stringWithFormat:@"规格:  %@",btn.titleLabel.text];
                    
                }
                
                yansex = btn.frame.origin.x+btn.frame.size.width+10;
                
                yansetag++;
                
            }
            
            UIView * xian1 = [[UIView alloc] initWithFrame:CGRectMake(10, yansey+25+10, APPwidth-20, 1)];
            xian1.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
            [_ggview addSubview:xian1];
            
            
            gueigey = xian1.frame.origin.y+10;
            
        }
        
        //*************尺码分类*************
        
        if (j == 1) {
            
            
            float cimax = 10;
            float cimay = label1.frame.origin.y+30;
            _chimaarray = @[@"S",@"M",@"L",@"XL",@"XXL"];
            int chimatag = 810000;
            
            for (int k = 0; k < _chimaarray.count; k++) {
                
                
                UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(cimax, cimay, 40, 20)];
                label.text = _chimaarray[k];
                label.font = [UIFont systemFontOfSize:13];
                label.textColor = [UIColor clearColor];
                [_ggview addSubview:label];
                [label sizeToFit];
                
                
                UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.size.width+20, label.frame.size.height+10)];
                [btn setTitle:_chimaarray[k] forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0] forState:UIControlStateNormal];
                btn.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
                btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
                btn.layer.cornerRadius = 5;
                btn.layer.masksToBounds = YES;
                [btn addTarget:self action:@selector(chimaxuanzhe:) forControlEvents:UIControlEventTouchUpInside];
                btn.tag = chimatag;
                btn.titleLabel.font = [UIFont systemFontOfSize:13];
                [_ggview addSubview:btn];
                
                
                
                if (btn.frame.origin.x+btn.frame.size.width>APPwidth-5) {
                    
                    CGRect fram = btn.frame;
                    fram.origin.y = btn.frame.origin.y+btn.frame.size.height+10;
                    fram.origin.x = 15;
                    btn.frame = fram;
                    
                    
                    cimay =  btn.frame.origin.y;
                    
                    
                }
                
                if (k == 0) {
                    
                    btn.backgroundColor = [UIColor orangeColor];
                    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    
                    _gueigelabel.text = [NSString stringWithFormat:@"%@  %@",_gueigelabel.text,btn.titleLabel.text];
                    
                }
                
                cimax = btn.frame.origin.x+btn.frame.size.width+10;
                
                chimatag++;
                
            }
            
            UIView * xian1 = [[UIView alloc] initWithFrame:CGRectMake(10, cimay+25+10, APPwidth-20, 1)];
            xian1.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
            [_ggview addSubview:xian1];
            
            
            gueigey = xian1.frame.origin.y+20;
            
        }
        //*************数量选择*************
        if (j == 2) {
            
            
            UIButton * jianbtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-165, label1.frame.origin.y, 50, 30)];
            [jianbtn setImage:[UIImage imageNamed:@"xiangqing-jian1"] forState:UIControlStateNormal];
            [jianbtn setImage:[UIImage imageNamed:@"xiangqing-jian"] forState:UIControlStateSelected];
            jianbtn.tag = 5950;
            jianbtn.selected = YES;
            [jianbtn addTarget:self action:@selector(ggshulian:) forControlEvents:1<<6];
            [_ggview addSubview:jianbtn];
            jianbtn.selected = YES;
            jianbtn.userInteractionEnabled = NO;
            
            
            _shulianlabel = [[UILabel alloc] initWithFrame:CGRectMake(jianbtn.frame.origin.x+jianbtn.frame.size.width, jianbtn.frame.origin.y, 50, 30)];
            _shulianlabel.text = [NSString stringWithFormat:@"%d",_shuliang];
            _shulianlabel.textAlignment = NSTextAlignmentCenter;
            _shulianlabel.font =  [UIFont systemFontOfSize:18];
            _shulianlabel.textColor = [UIColor blackColor];
            [_ggview addSubview:_shulianlabel];
            
            
            UIButton * jiabtn = [[UIButton alloc] initWithFrame:CGRectMake(_shulianlabel.frame.origin.x+_shulianlabel.frame.size.width, _shulianlabel.frame.origin.y, 50, 30)];
            [jiabtn setImage:[UIImage imageNamed:@"xiangqing-jia"] forState:UIControlStateNormal];
            [jiabtn setImage:[UIImage imageNamed:@"xiangqing-jia1"] forState:UIControlStateSelected];
            jiabtn.tag = 5951;
            [jiabtn addTarget:self action:@selector(ggshulian:) forControlEvents:1<<6];
            [_ggview addSubview:jiabtn];
            
            
            CGRect fram = _ggview.frame;
            fram.size.height = jianbtn.frame.size.height+jianbtn.frame.origin.y+70;
            _ggview.frame = fram;
            
            
        }
        
        
        
        
    }
    
    
    
    _qdbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, _ggview.frame.size.height-50, APPwidth, 50)];
    _qdbtn.backgroundColor = [UIColor colorWithRed:254/255.0 green:30/255.0 blue:76/255.0 alpha:1.0];
    [_qdbtn setTitle:@"确定" forState:0];
    _qdbtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [_qdbtn addTarget:self action:@selector(goumaiclick:) forControlEvents:1<<6];
    _qdbtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [_ggview addSubview:_qdbtn];
    
}



#pragma mark - 创建优惠券界面
-(void)zdyyouhueiquanui
{
  
    
    _youhueiquanview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, APPheight)];
    _youhueiquanview.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [self.view addSubview:_youhueiquanview];
    _youhueiquanview.hidden = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ycyouhueiquanui)];
    [_youhueiquanview addGestureRecognizer:tap];
    
    
    
    _yhqview = [[UIView alloc] initWithFrame:CGRectMake(0, APPheight, APPwidth, 380)];
    _yhqview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_yhqview];
    
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 60)];
    label.text = @"   领取优惠券";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:18];
    label.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    [_yhqview addSubview:label];
    


    NSArray * array1 = @[@"20元",@"10元"];
    NSArray * array2 = @[@"订单满100元使用(不含邮费)",@"订单满50元使用(不含邮费)"];
    NSArray * array3 = @[@"使用期限2017.03.21-2017.03.30",@"使用期限2017.03.21-2017.04.10"];
    for (int i = 0; i < array1.count; i++) {
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 60+115*i, APPwidth, 115)];
        [_yhqview addSubview:view];
        
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, APPwidth-100, 20)];
        label1.textColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
        label1.font = [UIFont systemFontOfSize:26];
        [view addSubview:label1];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:array1[i]];
        [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(str.length-1, 1)];
        label1.attributedText = str;
        
        
        
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(15, 50, APPwidth-100, 20)];
        label2.text = array2[i];
        label2.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
        label2.font = [UIFont systemFontOfSize:15];
        [view addSubview:label2];
        
        
        UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(15, 75, APPwidth-100, 20)];
        label3.text = array3[i];
        label3.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
        label3.font = [UIFont systemFontOfSize:13];
        [view addSubview:label3];
        
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-85, view.frame.size.height/2-17.5, 70, 35)];
        btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:60/255.0 alpha:1.0];
        [btn setTitle:@"领取" forState:0];
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        btn.layer.cornerRadius = 10;
        btn.layer.masksToBounds = YES;
        [view addSubview:btn];
        
        
        UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(15, 114, APPwidth-30, 1)];
        xian.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
        [view addSubview:xian];
        
    }

    
    UIButton * _guanbibtn = [[UIButton alloc] initWithFrame:CGRectMake(0, _yhqview.frame.size.height-50, APPwidth, 50)];
    _guanbibtn.backgroundColor = [UIColor colorWithRed:254/255.0 green:30/255.0 blue:76/255.0 alpha:1.0];
    [_guanbibtn setTitle:@"关闭" forState:0];
    _guanbibtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [_guanbibtn addTarget:self action:@selector(ycyouhueiquanui) forControlEvents:1<<6];
    _guanbibtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [_yhqview addSubview:_guanbibtn];

}


#pragma mark - cell
//一组多少条
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return  _gwcshujuyuan.count;
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}


//cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * str = @"cell";
    SCGouWuCheCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        
        cell = [[SCGouWuCheCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:str];
        
    }
    

    SCGouWuCheModel * model = [_gwcshujuyuan objectAtIndex:indexPath.row];

    
    [cell.xuanzhe setImage:[UIImage imageNamed:@"mall_weixuanzhong"] forState:0];
    [cell.xuanzhe setImage:[UIImage imageNamed:@"mall_xuanzhong"] forState:UIControlStateSelected];
    [cell.xuanzhe addTarget:self action:@selector(xuanzhe:) forControlEvents:1<<6];
    cell.xuanzhe.tag = _gwctag;
    _gwctag++;
    
    cell.datu.image = [UIImage imageNamed:@"shouyexiaotu1"];

    
    
    cell.biaoting.text = @"商品标题商品标题商品标题";
    cell.biaoting.textAlignment = 0;
    cell.biaoting.font = [UIFont systemFontOfSize:14];
    cell.biaoting.textColor = [UIColor blackColor];
    
    
    [cell.gueige setTitle:@"颜色分类：补水6件套" forState:0];
    [cell.gueige setTitleColor:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] forState:0];
    cell.gueige.titleLabel.font = [UIFont systemFontOfSize:12];
    cell.gueige.contentHorizontalAlignment = 1;
    [cell.gueige sizeToFit];
    [cell.gueige addTarget:self action:@selector(gueigexuanzhe:) forControlEvents:1<<6];

    
    
    [cell.gueigexuanzhejiantou setImage:[UIImage imageNamed:@"mall_xialajian"] forState:0];
    cell.gueigexuanzhejiantou.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    CGRect fram = cell.gueigexuanzhejiantou.frame;
    fram.origin.x = cell.gueige.frame.origin.x+cell.gueige.frame.size.width;
    fram.size.height = cell.gueige.frame.size.height;
    cell.gueigexuanzhejiantou.frame = fram;
    [cell.gueigexuanzhejiantou addTarget:self action:@selector(gueigexuanzhe:) forControlEvents:1<<6];

    if ([_bianjizhuantai isEqualToString:@"完成"]) {
        
        cell.gueige.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    
        cell.gueige.userInteractionEnabled = YES;

        cell.gueigexuanzhejiantou.hidden = NO;

    }
    else{
        
        cell.gueige.backgroundColor = [UIColor clearColor];
    
        cell.gueige.userInteractionEnabled = NO;
        
        cell.gueigexuanzhejiantou.hidden = YES;
        

    }
    

    cell.jiage.text = @"¥99.00";
    cell.jiage.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    cell.jiage.font = [UIFont systemFontOfSize:16];
    cell.jiage.textAlignment = 2;
    
    
    
    cell.yuanjia.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    cell.yuanjia.font = [UIFont systemFontOfSize:11];
    cell.yuanjia.textAlignment = 2;
    NSString * zstr = @"¥199.00";
    NSDictionary *zhxDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *zhxStr = [[NSMutableAttributedString alloc]initWithString:zstr attributes:zhxDic];
    cell.yuanjia.attributedText = zhxStr;
    


    
    [cell.jian setTitle:@"-" forState:UIControlStateNormal];
    [cell.jian setTitleColor:[UIColor colorWithRed:255/255.0 green:178/255.0 blue:18/255.0 alpha:1.0] forState:UIControlStateNormal];
    cell.jian.layer.borderColor=[[UIColor colorWithRed:255/255.0 green:178/255.0 blue:18/255.0 alpha:1.0]CGColor];
    cell.jian.layer.borderWidth= 1.0f;
    cell.jian.layer.cornerRadius = 15;
    cell.jian.layer.masksToBounds = YES;
    cell.jian.contentHorizontalAlignment = 0;
    [cell.jian addTarget:self action:@selector(shulian:) forControlEvents:1<<6];
    cell.jian.tag = _gwcjiantag;
    
    _gwcjiantag++;
    
    
    
    cell.shuliang.text = model.shuliang;
    cell.shuliang.font = [UIFont systemFontOfSize:15];
    cell.shuliang.textColor = [UIColor colorWithRed:255/255.0 green:178/255.0 blue:18/255.0 alpha:1.0];
    cell.shuliang.textAlignment = 1;
    cell.shuliang.layer.borderColor=[[UIColor colorWithRed:255/255.0 green:178/255.0 blue:18/255.0 alpha:1.0]CGColor];
    cell.shuliang.layer.borderWidth= 1.0f;
    cell.shuliang.layer.cornerRadius = 15;
    cell.shuliang.layer.masksToBounds = YES;
    
    
    
    [cell.jia setTitle:@"+" forState:UIControlStateNormal];
    [cell.jia setTitleColor:[UIColor colorWithRed:255/255.0 green:178/255.0 blue:18/255.0 alpha:1.0] forState:UIControlStateNormal];
    cell.jia.layer.borderColor=[[UIColor colorWithRed:255/255.0 green:178/255.0 blue:18/255.0 alpha:1.0]CGColor];
    cell.jia.layer.borderWidth= 1.0f;
    cell.jia.layer.cornerRadius = 15;
    cell.jia.layer.masksToBounds = YES;
    cell.jia.contentHorizontalAlignment = 0;
    [cell.jia addTarget:self action:@selector(shulian:) forControlEvents:1<<6];
    cell.jia.tag = _gwcjiatag;
    _gwcjiatag++;
    
    
    [cell.youhueiquan setTitle:@"优惠券" forState:0];
    [cell.youhueiquan setTitleColor:[UIColor colorWithRed:255/255.0 green:178/255.0 blue:18/255.0 alpha:1.0] forState:0];
    cell.youhueiquan.titleLabel.font = [UIFont systemFontOfSize:14];
    cell.youhueiquan.contentHorizontalAlignment = 2;
    [cell.youhueiquan addTarget:self action:@selector(youhueiquanclick:) forControlEvents:1<<6];
    

    
    cell.xian.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}


//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SCXiangQingVC * scxq = [[SCXiangQingVC alloc] init];
    [self.navigationController pushViewController:scxq animated:YES];
}


//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
    
}


//设置头部视图的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 50;
}


//设置尾部视图的高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 100;
}


//自定义头部视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 50)];
    
    UILabel * label =[[UILabel alloc] initWithFrame:CGRectMake(15, 0, APPwidth-60, 50)];
    label.font =[UIFont systemFontOfSize:16];
    label.textAlignment = 0;
    label.textColor = [UIColor blackColor];
    label.text = @"自家de大宝贝";
    [view addSubview:label];

    
    UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(0, 49, APPwidth, 1)];
    xian.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    [view addSubview:xian];
    
  

    return view;
    
}


//自定义尾部视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 100)];
   view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];

    UILabel * label =[[UILabel alloc] initWithFrame:CGRectMake(10, 80, APPwidth-60, 20)];
    label.font =[UIFont systemFontOfSize:18];
    label.textAlignment = 0;
    label.textColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1.0];
    [view addSubview:label];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"猜你喜欢  RECOMMEND"];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(6, 9)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] range:NSMakeRange(6,9)];
    label.attributedText = str;
    
    return view;
    
}

//左滑出现删除按钮
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

//执行删除操作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {

//        [self.RoomNames removeObjectAtIndex:indexPath.row];         // Delete the row from the data source.
//        [self.MainTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


/**
 *  修改Delete按钮文字为“删除”
 */
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
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
    cell.biaoting.textColor = [UIColor colorWithRed:88/255.0 green:88/255.0 blue:88/255.0 alpha:1.0];
    cell.biaoting.numberOfLines = 2;
    cell.biaoting.font = [UIFont systemFontOfSize:14];
    
    
    cell.jiage.text = @"¥99.00";
    cell.jiage.textColor = [UIColor blackColor];
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


#pragma mark - 修改数量
-(void)shulian:(UIButton *)btn
{
    NSLog(@"%@",btn.titleLabel.text);
    NSLog(@"%ld",(long)btn.tag);

    NSString * str = [NSString stringWithFormat:@"%ld",(long)btn.tag];
    NSString * tagstr = [str substringFromIndex:str.length-1];
    
    if ([btn.titleLabel.text isEqualToString:@"+"]) {
        
        for (int i = 0; i < _gwcshujuyuan.count; i++) {
            
            SCGouWuCheModel * model = _gwcshujuyuan[i];

            if (i == [tagstr intValue]) {
                int shulian = [model.shuliang intValue];
                shulian++;
                model.shuliang = [NSString stringWithFormat:@"%d",shulian];
            }
            
            
        }
        
        [_tableview reloadData];
        
        
    }
    else{
        
        for (int i = 0; i < _gwcshujuyuan.count; i++) {
            
            SCGouWuCheModel * model = _gwcshujuyuan[i];
            
            if (i == [tagstr intValue]) {
                int shulian = [model.shuliang intValue];
                if (shulian > 1) {
                    shulian--;
                    model.shuliang = [NSString stringWithFormat:@"%d",shulian];
                }
                
                
                NSLog(@"%@",model.shuliang);
            }
            
            
        }
        [_tableview reloadData];

    }
}

#pragma mark - 选择商品
-(void)xuanzhe:(UIButton *)btn
{
    if (btn.selected == YES) {
        
        btn.selected = NO;
        _yixuangeshu--;
        
    }
    else{
        
        btn.selected = YES;
        
        _yixuangeshu++;
        

    }
    
    [_quanxuanbtn setTitle:[NSString stringWithFormat:@"全选(%d)",_yixuangeshu] forState:0];
    _quanxuanbtn.selected = NO;
    _quanxuanbool = YES;

    if (_yixuangeshu == _gwcshujuyuan.count) {
       
        _quanxuanbtn.selected = YES;
        _quanxuanbool = NO;
    }
    
}



#pragma mark - 全选
-(void)quanxuanclick:(UIButton *)btn
{
    if (_quanxuanbool == YES) {
        
        [btn setTitle:[NSString stringWithFormat:@"全选(%lu)",(unsigned long)_gwcshujuyuan.count] forState:0];
        
        btn.selected = YES;
        _quanxuanbool = NO;
        
        _yixuangeshu = _gwcshujuyuan.count;

        for (int i = 61000; i < _gwctag; i++) {
            
            UIButton * btn1 = [self.view viewWithTag:i];
            btn1.selected = YES;
            
        }
    }
    else
    {
        [btn setTitle:@"全选(0)" forState:0];
        btn.selected = NO;
        _quanxuanbool = YES;
        
        _yixuangeshu = 0;
 
        for (int i = 61000; i < _gwctag; i++) {
            
            UIButton * btn1 = [self.view viewWithTag:i];
            btn1.selected = NO;
            
        }
        
    }
    
    
}



#pragma mark - 编辑
-(void)bianjiclick:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"编辑"]) {
        
        [btn setTitle:@"完成" forState:0];
        
        _bianjizhuantai = @"完成";

        [_tableview reloadData];
    }
    else{
        
        
        [btn setTitle:@"编辑" forState:0];
        
        _bianjizhuantai = @"编辑";

        [_tableview reloadData];

    }
    
}
#pragma mark - 点击选择规格——弹出规格选择框
-(void)gueigexuanzhe:(UIButton *)btn
{
    NSLog(@"选择规格");
    
    _gueigeview.hidden = NO;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect fram = _ggview.frame;
        fram.origin.y = APPheight-_ggview.frame.size.height;
        _ggview.frame = fram;
        
    }];
    

}



#pragma mark - 隐藏规格选择界面
-(void)ycgueigeui
{
    _gueigeview.hidden = YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect fram = _ggview.frame;
        fram.origin.y = APPheight+40;
        _ggview.frame = fram;
        
    }];
    
    
}



#pragma mark - 颜色选择
-(void)yansexuanzhe:(UIButton *)btn
{
    
    for(int i = 710000;i< _yansearray.count+710000;i++)
    {
        
        UIButton * btn1 = (UIButton *)[self.view viewWithTag:i];
        [btn1 setTitleColor:[UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0] forState:UIControlStateNormal];
        btn1.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    }
    
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    NSArray * array = [_gueigelabel.text componentsSeparatedByString:@"  "];
    
    _gueigelabel.text = [NSString stringWithFormat:@"%@  %@  %@",array[0],btn.titleLabel.text,array[2]];
    
}



#pragma mark - 尺码选择
-(void)chimaxuanzhe:(UIButton *)btn
{
    
    for(int i = 810000;i< _chimaarray.count+810000;i++)
    {
        
        UIButton * btn1 = (UIButton *)[self.view viewWithTag:i];
        [btn1 setTitleColor:[UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0] forState:UIControlStateNormal];
        btn1.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    }
    
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    NSArray * array = [_gueigelabel.text componentsSeparatedByString:@"  "];
    
    _gueigelabel.text = [NSString stringWithFormat:@"%@  %@  %@",array[0],array[1],btn.titleLabel.text];
    
}




#pragma mark - 规格选择——商品数量增减
-(void)ggshulian:(UIButton *)btn
{
    
    switch (btn.tag) {
            
            //减
        case 5950:
        {
            
            _shuliang--;
            
        }
            break;
            
            //加
        case 5951:
        {
            
            _shuliang++;
            
        }
            break;
            
        default:
            break;
    }
    
    _shulianlabel.text = [NSString stringWithFormat:@"%d",_shuliang];
    
    if (_shuliang == 1) {
        
        UIButton * btn = (UIButton *)[self.view viewWithTag:5950];
        btn.selected = YES;
        btn.userInteractionEnabled = NO;
        
    }
    else
    {
        UIButton * btn = (UIButton *)[self.view viewWithTag:5950];
        btn.selected = NO;
        btn.userInteractionEnabled = YES;
    }
    
    
    if (_shuliang == 10) {
        
        UIButton * btn = (UIButton *)[self.view viewWithTag:5951];
        btn.selected = YES;
        btn.userInteractionEnabled = NO;
        
    }
    else
    {
        UIButton * btn = (UIButton *)[self.view viewWithTag:5951];
        btn.selected = NO;
        btn.userInteractionEnabled = YES;
    }
    
    
    
}


#pragma mark - 规格选择完毕——点击确认
-(void)goumaiclick:(UIButton *)btn
{
    
    _gueigeview.hidden = YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect fram = _ggview.frame;
        fram.origin.y = APPheight+40;
        _ggview.frame = fram;
        
    }];
    
    
    
}



#pragma mark - 优惠券点击——弹出优惠券框
-(void)youhueiquanclick:(UIButton *)btn
{
    _youhueiquanview.hidden = NO;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect fram = _yhqview.frame;
        fram.origin.y = APPheight-380;
        _yhqview.frame = fram;
        
    }];
    

}

#pragma mark - 隐藏优惠券框
-(void)ycyouhueiquanui
{
    _youhueiquanview.hidden = YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect fram = _yhqview.frame;
        fram.origin.y = APPheight;
        _yhqview.frame = fram;
        
    }];
    

}

#pragma mark - 结算
-(void)jiesuanclick
{
    SCTJDDVC * tjdd = [[SCTJDDVC alloc] init];
    [self.navigationController pushViewController:tjdd animated:YES];
    

}

#pragma mark - 消息
-(void)xiaoxiclick
{
    
    SCXXVC * scxx = [[SCXXVC alloc] init];
    scxx.biaoting = @"商城消息";
    [self.navigationController pushViewController:scxx animated:YES];
    
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
