//
//  BaseViewController.h
//  聚宝在线
//
//  Created by 岳青山 on 14/12/18.
//  Copyright (c) 2014年 岳青山. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "MBProgressHUD.h"
//#import <AFNetworking.h>
//#import "AFNetClient.h"
#import "AppDelegate.h"
//#import "RefreshControl.h"
//#import "JDStatusBarNotification.h"
//#import <UIImageView+AFNetworking.h>

@interface BaseViewController : UIViewController//<MBProgressHUDDelegate>

@property (nonatomic) NSInteger rightItemType;
-(void)showSingleAlert:(NSString*)tips;
-(void)showServerErrorAlert;
//rightItemType:1/2/3/4/
-(void)loadBarButton:(NSInteger)rightItemType;
@end
