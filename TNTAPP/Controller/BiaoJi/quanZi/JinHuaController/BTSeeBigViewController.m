//
//  BTSeeBigViewController.m
//  LEYOUYOU
//
//  Created by Inspirr Mac on 16/11/18.
//  Copyright © 2016年 tangbin. All rights reserved.
//

#import "BTSeeBigViewController.h"
#import "BTTopic.h"
#import <UIImageView+WebCache.h>
#import <SVProgressHUD.h>
//从ios9.0开始完全弃用
#import <AssetsLibrary/AssetsLibrary.h>
//从ios8.0开始可用
#import <Photos/Photos.h>
@interface BTSeeBigViewController ()<UIScrollViewDelegate>
@property(nonatomic,weak)UIImageView* imageView;
@end

static NSString* const BTCollectionName = @"百思百思";
@implementation BTSeeBigViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIScrollView* scrollview = [[UIScrollView alloc]init];
    scrollview.delegate =self;
    scrollview.frame = [UIScreen mainScreen].bounds;
    [self.view insertSubview:scrollview atIndex:0];
    
     // imageView
    UIImageView* imageview = [[UIImageView alloc]init];
    [imageview sd_setImageWithURL:[NSURL URLWithString:_topic.large_image]];
    imageview.width = scrollview.width;
    imageview.height = self.topic.height*imageview.width/_topic.width;
    imageview.x =0;
    if (imageview.height>=scrollview.height) {//图片高度超过整个屏幕
    
        imageview.y=0;
    }else{//居中显示
        imageview.centerY =scrollview.height*0.5;
    }
    [scrollview addSubview:imageview];
    self.imageView = imageview;
    //滚动范围
    scrollview.contentSize = CGSizeMake(0, imageview.height);
    //缩放比例
    CGFloat maxscale = _topic.height/imageview.height;
    if (maxscale>1.0) {
        scrollview.maximumZoomScale = maxscale;
    }
}


- (IBAction)backBtnClicked:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (IBAction)saveBtnClicked:(id)sender {
    // 0.判断状态
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusDenied) {// 用户拒绝当前应用访问相册
        TNTLog(@"用户拒绝当前应用访问相册 - 提醒用户打开访问开关");
        
    }else if (status==PHAuthorizationStatusRestricted){
    //家长控制
        TNTLog(@"家长控制 - 不允许访问");
    
    }else if (status==PHAuthorizationStatusNotDetermined){
        // 用户还没有做出选择
    TNTLog(@"用户还没有做出选择");
        [self saveImage];
    }else if (status==PHAuthorizationStatusAuthorized){
        // 用户允许当前应用访问相册
    TNTLog(@"用户允许当前应用访问相册");
        [self saveImage];

    }
    
    
}


/**
 *  保存图片到相册
 */
-(void)saveImage{
    /*
     PHAsset : 一个PHAsset对象就代表一个资源文件, 比如一张图片
     
     PHAssetCollection : 一个PHAssetCollection对象就代表一个相册
     */
    
    __block NSString* assertid = nil;
    
    // 1.存储图片到"相机胶卷"
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        //这个block里面存放一些修改性质的代码
        // 新建一个PHAssetCreationRequest对象, 保存图片到"相机胶卷"
        // 返回PHAsset(图片)的字符串标识
       assertid = [PHAssetCreationRequest creationRequestForAssetFromImage:self.imageView.image].placeholderForCreatedAsset.localIdentifier;
        
        
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        if (error) {
             TNTLog(@"保存图片到相机胶卷中失败");
            return ;
        }
        
        TNTLog(@"成功保存图片到相机胶卷中");
        
        // 2.获得相册对象
        PHAssetCollection * collection = [self traitCollection];
         // 3.将相册胶卷中的图片添加到新的相册
        [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
            PHAssetCollectionChangeRequest * request = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:collection];
            
            //根据唯一标获得相片对象
            PHAsset* asset = [PHAsset fetchAssetsWithLocalIdentifiers:@[assertid] options:nil].firstObject;
            //添加图片到相册中
            [request addAssets:@[asset]];
            
        } completionHandler:^(BOOL success, NSError * _Nullable error) {
            
            if (error) {
                TNTLog(@"添加图片到相册中失败");
                return ;
            }
            
            TNTLog(@"成功添加图片到相册中");
           [[NSOperationQueue mainQueue] addOperationWithBlock:^{
               [SVProgressHUD showSuccessWithStatus:@"保存成功"];
           }];
            
            
        }];
    }];
}



#pragma mark  <uiscrollviewDelegate>

/**
 返回一个uiscrollview内部的子控件进行缩放
 */
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;

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
