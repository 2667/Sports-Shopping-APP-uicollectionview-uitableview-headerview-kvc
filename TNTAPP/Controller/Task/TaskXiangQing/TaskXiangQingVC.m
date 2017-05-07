//
//  TaskXiangQingVC.m
//  TNTAPP
//
//  Created by tnt_mdf on 2017/1/10.
//  Copyright © 2017年 TNT. All rights reserved.
//

#import "TaskXiangQingVC.h"
#import "RWXQNeiRonView.h"
#import "LiuYanCell.h"


@interface TaskXiangQingVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _tableview;
    
}

@end

@implementation TaskXiangQingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self zdydhl];
    
    [self zdyUI];
}


#pragma mark - 自定义导航栏
-(void)zdydhl
{
    UIView * daohan = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 64)];
    daohan.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [self.view addSubview:daohan];
    UIImageView * xian = [[UIImageView alloc] initWithFrame:CGRectMake(0, 63, APPwidth, 1)];
    xian.image =[UIImage imageNamed:@"shouye-fengexian"];
    [daohan addSubview:xian];
    
    
    UIButton * fanhueibtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 26, 30, 30)];
    [fanhueibtn setImage:[UIImage imageNamed:@"fanhuitubiao"] forState:UIControlStateNormal];
    [fanhueibtn addTarget:self action:@selector(fanhuei) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:fanhueibtn];
    
    
    UILabel * biaoting = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, APPwidth-200, 44)];
    biaoting.text = @"详情";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = NSTextAlignmentCenter;
    biaoting.font = [UIFont systemFontOfSize:20];
    [daohan addSubview:biaoting];
    
    
    //收藏
    UIButton * shoucangbtn = [[UIButton alloc]initWithFrame:CGRectMake(APPwidth-70, 26, 30, 30)];
    [shoucangbtn setImage:[UIImage imageNamed:@"renwu_shoucang1"] forState:UIControlStateNormal];
    [shoucangbtn addTarget:self action:@selector(shoucang) forControlEvents:UIControlEventTouchUpInside];
    [daohan addSubview:shoucangbtn];
    

    
    //下拉框
    UIButton * xialabtn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-40, 26, 30, 30)];
    [xialabtn setImage:[UIImage imageNamed:@"renwu_gengduo1"] forState:UIControlStateNormal];
    [xialabtn addTarget:self action:@selector(xiala) forControlEvents:UIControlEventTouchUpInside];
    xialabtn.tag = 6201;
    [daohan addSubview:xialabtn];
    
    
    
}


#pragma mark - 自定义UI
-(void)zdyUI
{

    UIView * toubuview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64)];
    toubuview.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    [self.view addSubview:toubuview];
    
   
    
#if 1
    //*************任务内容*****************
    UIView * neironview= [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 330)];
    neironview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [toubuview addSubview:neironview];

    UIImageView * touxiangimg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
    touxiangimg.layer.cornerRadius = 30;
    touxiangimg.layer.masksToBounds = YES;
    touxiangimg.backgroundColor = [UIColor orangeColor];
    [neironview addSubview:touxiangimg];
    
    UILabel * jiage = [[UILabel alloc] initWithFrame:CGRectMake(touxiangimg.frame.origin.x+touxiangimg.frame.size.width+15, 15, 60, 20)];
    jiage.text = @"￥200";
    jiage.textColor = [UIColor whiteColor];
    jiage.layer.cornerRadius = 4;
    jiage.layer.masksToBounds = YES;
    jiage.textAlignment = 1;
    jiage.backgroundColor = [UIColor colorWithRed:245/255.0 green:29/255.0 blue:73/255.0 alpha:1.0];
    jiage.font = [UIFont systemFontOfSize:17];
    [neironview addSubview:jiage];
    
    
    UILabel * biaoting = [[UILabel alloc] initWithFrame:CGRectMake(jiage.frame.origin.x+jiage.frame.size.width+16, 17, 100, 20)];
    biaoting.text = @"签到领奖";
    biaoting.textColor = [UIColor whiteColor];
    biaoting.textAlignment = 0;
    [neironview addSubview:biaoting];
    biaoting.font = [UIFont systemFontOfSize:18];
    [biaoting sizeToFit];
    
    UILabel * fubiao = [[UILabel alloc] initWithFrame:CGRectMake(biaoting.frame.origin.x+biaoting.frame.size.width+5, biaoting.frame.origin.y, 35, 15)];
    fubiao.text = @"咖啡";
    fubiao.textColor = [UIColor whiteColor];
    fubiao.layer.cornerRadius = 5;
    fubiao.layer.masksToBounds = YES;
    fubiao.textAlignment = 1;
    fubiao.backgroundColor = [UIColor colorWithRed:0/255.0 green:153/255.0 blue:152/255.0 alpha:1.0];
    fubiao.font = [UIFont systemFontOfSize:13];
    [neironview addSubview:fubiao];
    

    
    UILabel * shijian1 = [[UILabel alloc] initWithFrame:CGRectMake(jiage.frame.origin.x, jiage.frame.origin.y+jiage.frame.size.height+10, 100, 20)];
    shijian1.text = @"12分钟前发布";
    shijian1.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    shijian1.textAlignment = 0;
    shijian1.font = [UIFont systemFontOfSize:13];
    [neironview addSubview:shijian1];
    
    
    UIScrollView * tupian = [[UIScrollView alloc] initWithFrame:CGRectMake(10, touxiangimg.frame.origin.y+touxiangimg.frame.size.height+10, APPwidth-10, 220)];
    tupian.backgroundColor = [UIColor whiteColor];
    [toubuview addSubview:tupian];

    
    UIImageView * img1 = [[UIImageView alloc] initWithFrame:CGRectMake(tupian.frame.origin.x, tupian.frame.origin.y+tupian.frame.size.height+10, 12, 12)];
    img1.image = [UIImage imageNamed:@"renwu_shijian"];
    [neironview addSubview:img1];
    
    UILabel * shijian2 = [[UILabel alloc] initWithFrame:CGRectMake(img1.frame.origin.x+img1.frame.size.width+5,img1.frame.origin.y,  100, 12)];
    shijian2.text = @"2017.01.30过期";
    shijian2.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    shijian2.textAlignment = 0;
    shijian2.font = [UIFont systemFontOfSize:13];
    [neironview addSubview:shijian2];

    
    UIImageView * img2 = [[UIImageView alloc] initWithFrame:CGRectMake(shijian2.frame.origin.x+shijian2.frame.size.width+20, tupian.frame.origin.y+tupian.frame.size.height+10, 12, 12)];
    img2.image = [UIImage imageNamed:@"renwu_rendu"];
    [neironview addSubview:img2];
    
    UILabel * linqu = [[UILabel alloc] initWithFrame:CGRectMake(img2.frame.origin.x+img2.frame.size.width+5,img2.frame.origin.y,  100, 12)];
    linqu.text = @"120/450已领";
    linqu.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    linqu.textAlignment = 0;
    linqu.font = [UIFont systemFontOfSize:13];
    [neironview addSubview:linqu];

    
    //*************地址*****************
    UIView * rwdiziview = [[UIView alloc] initWithFrame:CGRectMake(0, neironview.frame.origin.y+neironview.frame.size.height+10, APPwidth, 60)];
    rwdiziview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [toubuview addSubview:rwdiziview];
    
    UILabel * dizi1 = [[UILabel alloc] initWithFrame:CGRectMake(10,10,  APPwidth-130, 20)];
    dizi1.text = @"中环都爹利街13号乐成行地库中层";
    dizi1.textColor = [UIColor whiteColor];
    dizi1.textAlignment = 0;
    dizi1.font = [UIFont systemFontOfSize:15];
    [rwdiziview addSubview:dizi1];
    
    UILabel * dizi2 = [[UILabel alloc] initWithFrame:CGRectMake(10,dizi1.frame.origin.y+dizi1.frame.size.height,  APPwidth-150, 20)];
    dizi2.text = @"地铁中环站G出口，步行约5分钟";
    dizi2.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    dizi2.textAlignment = 0;
    dizi2.font = [UIFont systemFontOfSize:13];
    [rwdiziview addSubview:dizi2];
    

    UILabel * juli = [[UILabel alloc] initWithFrame:CGRectMake(APPwidth-70,20,  60, 20)];
    juli.text = @"390m";
    juli.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    juli.textAlignment = 0;
    juli.font = [UIFont systemFontOfSize:13];
    [rwdiziview addSubview:juli];
    UIImageView * juliimg = [[UIImageView alloc] initWithFrame:CGRectMake(APPwidth-86, 24, 12, 12)];
    juliimg.image = [UIImage imageNamed:@"renwu_juli"];
    [rwdiziview addSubview:juliimg];
    

    
    UIImageView * xian1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 59, APPwidth, 1)];
    xian1.image = [UIImage imageNamed:@"shouye-fengexian"];
    [rwdiziview addSubview:xian1];
    
    //*************进程*****************
    UIView * rwjincheview = [[UIView alloc] initWithFrame:CGRectMake(0, rwdiziview.frame.origin.y+rwdiziview.frame.size.height, APPwidth, 93)];
    rwjincheview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [toubuview addSubview:rwjincheview];
    
    UILabel * jincheng = [[UILabel alloc] initWithFrame:CGRectMake(0,10,  APPwidth, 20)];
    jincheng.text = @"任 务 进 程";
    jincheng.textColor = [UIColor whiteColor];
    jincheng.textAlignment = 1;
    jincheng.font = [UIFont systemFontOfSize:18];
    [rwjincheview addSubview:jincheng];
    
    NSArray * array = @[@"领取",@"进行中...",@"签到/领奖",@"评价"];
    for (int i = 0; i < array.count; i++) {
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake((APPwidth-30)/4*i+15, 45, (APPwidth-30)/4, 20)];
        label.text = array[i];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = 1;
        label.font = [UIFont systemFontOfSize:13];
        [rwjincheview addSubview:label];
        

        UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(label.frame.origin.x+label.frame.size.width/2-4, label.frame.origin.y+30, 8, 8)];
        imgv.image =[UIImage imageNamed:@"remwu_tuoyuan"];
        [rwjincheview addSubview:imgv];
        
        if (i < 3) {
        
            UIView * xian = [[UIView alloc] initWithFrame:CGRectMake(imgv.frame.origin.x+imgv.frame.size.width+4, imgv.frame.origin.y+3.5, label.frame.size.width-16, 1)];
            xian.backgroundColor =[UIColor colorWithRed:101/255.0 green:101/255.0 blue:101/255.0 alpha:1.0];
            [rwjincheview addSubview:xian];
            
        }
       

    }
    
    UIImageView * xian2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 92, APPwidth, 1)];
    xian2.image = [UIImage imageNamed:@"shouye-fengexian"];
    [rwjincheview addSubview:xian2];
    
    //*************详情*****************
    UIView * rwxiangqingview = [[UIView alloc] initWithFrame:CGRectMake(0, rwjincheview.frame.origin.y+rwjincheview.frame.size.height, APPwidth, 200)];
    rwxiangqingview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [toubuview addSubview:rwxiangqingview];
    

    UILabel * xiangqing1 = [[UILabel alloc] initWithFrame:CGRectMake(0,10,  APPwidth, 20)];
    xiangqing1.text = @"任 务 详 情";
    xiangqing1.textColor = [UIColor whiteColor];
    xiangqing1.textAlignment = 1;
    xiangqing1.font = [UIFont systemFontOfSize:18];
    [rwxiangqingview addSubview:xiangqing1];
    
    UILabel * xiangqing2 = [[UILabel alloc] initWithFrame:CGRectMake(10,xiangqing1.frame.origin.y+xiangqing1.frame.size.height+10,  APPwidth-20, 50)];
    NSString *labelText = @"小街风情意大利餐厅供应地道的意式风情美食。餐厅创办10余年，秉承一贯品质至上的原则，意大利厨师团队为您打造别具风格的地道意式美食，餐厅的装修淳朴亲切，尽现浪漫的地中海风情，让许多身在异国的意大利人有归家般的温暖感觉。口感淳厚地道的海鲜汤、风味诱人的意粉、鲜嫩美妙的安格斯肉扒、醇美沁肺的意大利红酒、香浓舒润的提拉米苏，小街风情带领你自由畅享意式乡土菜肴。";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5.0f];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    xiangqing2.attributedText = attributedString;
    xiangqing2.textColor = [UIColor whiteColor];
    xiangqing2.textAlignment = 0;
    xiangqing2.font = [UIFont systemFontOfSize:14];
    xiangqing2.numberOfLines = 0;
    [xiangqing2 sizeToFit];
    [rwxiangqingview addSubview:xiangqing2];
    
    
    CGRect fram = rwxiangqingview.frame;
    fram.size.height = xiangqing2.frame.origin.y+xiangqing2.frame.size.height+10;
    rwxiangqingview.frame = fram;

   
    
    //*************留言*****************
    UIView * rwliuyanview = [[UIView alloc] initWithFrame:CGRectMake(0, rwxiangqingview.frame.origin.y+rwxiangqingview.frame.size.height+10, APPwidth, 31)];
    rwliuyanview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [toubuview addSubview:rwliuyanview];
    
    
    UILabel * liuyan = [[UILabel alloc] initWithFrame:CGRectMake(10,0, APPwidth-20, 30)];
    liuyan.text = @"留言(188)";
    liuyan.textColor = [UIColor whiteColor];
    liuyan.textAlignment = 0;
    liuyan.font = [UIFont systemFontOfSize:16];
    [rwliuyanview addSubview:liuyan];
    
    UIImageView * xian3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 30, APPwidth, 1)];
    xian3.image = [UIImage imageNamed:@"shouye-fengexian"];
    [rwliuyanview addSubview:xian3];
    

    
    CGRect fram2 = toubuview.frame;
    fram2.size.height = rwliuyanview.frame.origin.y+rwliuyanview.frame.size.height;
    toubuview.frame = fram2;
    
    
    

    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, APPwidth, APPheight-64-60)];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableview.bounces = NO;
    _tableview.backgroundColor = [UIColor colorWithRed:34/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    [self.view addSubview:_tableview];
    

    _tableview.tableHeaderView = toubuview;

#endif

    //*************底部*****************
    UIView * dibuview = [[UIView alloc] initWithFrame:CGRectMake(0, APPheight-60, APPwidth, 60)];
    dibuview.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];
    [self.view addSubview:dibuview];
    
    NSArray * array1 = @[@"留言",@"电话",@"私信"];
    NSArray * array2 = @[@"renwu_xinxi",@"renwu_dianhua",@"renwu_sixin"];

    for (int i = 0; i < array1.count; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake((APPwidth-120)/3*i, 0, (APPwidth-120)/3, 60)];
        [dibuview addSubview:btn];
        
        UIImageView * imv = [[UIImageView alloc] initWithFrame:CGRectMake(btn.frame.size.width/2-10, 10, 20, 20)];
        imv.image = [UIImage imageNamed:array2[i]];
        [btn addSubview:imv];
        
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, imv.frame.origin.y+imv.frame.size.height, btn.frame.size.width, 30)];
        label.text = array1[i];
        label.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:15];
        [btn addSubview:label];

        if (i == 0) {
            
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(APPwidth-120, 0, 120, 60)];
            btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:181/255.0 blue:60/255.0 alpha:1.0];
            [btn setTitle:@"领 取" forState:0];
            [btn setTitleColor:[UIColor whiteColor] forState:0];
            btn.contentHorizontalAlignment = 0;
            [dibuview addSubview:btn];

            
            
            UIImageView * imv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APPwidth, 2)];
            imv.image = [UIImage imageNamed:@"shouye-fengexian"];
            [dibuview addSubview:imv];
        }
        else
        {
            UIImageView * imv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 2, 60)];
            imv.image = [UIImage imageNamed:@"renwu_fengexianshu"];
            [btn addSubview:imv];
        }
        
        
    }

    
}



#pragma mark - cell
//一组多少条
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
    
}



//cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * str = @"cell";
    LiuYanCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        
        cell = [[LiuYanCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    cell.touxiang.backgroundColor = [UIColor orangeColor];
    cell.touxiang.layer.cornerRadius = 20;
    cell.touxiang.layer.masksToBounds = YES;
    
    cell.name.text = @"哆啦A梦";
    cell.name.font = [UIFont systemFontOfSize:16];
    cell.name.textColor = [UIColor whiteColor];
    
    cell.shijian.text = @"02月10日 10:08";
    cell.shijian.font = [UIFont systemFontOfSize:12];
    cell.shijian.textColor = [UIColor colorWithRed:151/255.0 green:151/255.0 blue:151/255.0 alpha:1.0];

    NSString *labelText = @"小街风情意大利餐厅供应地道的意式风情美食。餐厅创办10余年，秉承一贯品质至上的原则，餐厅创办10余年，秉承一贯品质至上的原则，";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5.0f];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    cell.neirong.attributedText = attributedString;
    cell.neirong.font = [UIFont systemFontOfSize:12];
    cell.neirong.numberOfLines = 2;
    cell.neirong.textColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    
    
    cell.xian.image = [UIImage imageNamed:@"shouye-fengexian"];
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor colorWithRed:40/255.0 green:44/255.0 blue:49/255.0 alpha:1.0];

    
    return cell;
    
}


//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
    
}



#pragma mark - 下拉
-(void)xiala
{
    
}

#pragma mark - 收藏
-(void)shoucang
{
    NSLog(@"收藏");
    
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
