//
//  AppDelegate.h
//  meetxm
//
//  Created by 岳青山 on 15/5/3.
//  Copyright (c) 2015年 岳青山. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <EstimoteSDK/EstimoteSDK.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UIBackgroundTaskIdentifier bgTask;
    
    NSUInteger counter;
}

@property (strong, nonatomic) UIWindow *window;
//@property (strong, nonatomic) ESTCloudManager *cloudManager;

@end

