
#import <UIKit/UIKit.h>

/** 请求路径 */
NSString * const XMGRequestURL = @"http://api.budejie.com/api/api_open.php";
//NSString * const XMGRequestURL = @"nil";

/** 全局统一的间距 */
CGFloat const XMGMargin = 10;

/** group样式下最前面那个cell默认的Y值 */
CGFloat const XMGGorupFirstCellY = 35;

/** 导航栏的最大Y值(底部) */
CGFloat const XMGNavBarBottom = 64;

/** TabBar的高度 */
CGFloat const XMGTabBarH = 49;

/** 标题栏的高度 */
CGFloat const XMGTitlesViewH = 40;

/** 通知:重复点击了tabBar上的某个按钮 */
NSString * const XMGTabBarButtonDidRepeatClickNotification = @"XMGTabBarButtonDidRepeatClickNotification";

/** 通知:重复点击了titleView上的某个按钮 */
NSString * const XMGTitleButtonDidRepeatClickNotification = @"XMGTitleButtonDidRepeatClickNotification";
