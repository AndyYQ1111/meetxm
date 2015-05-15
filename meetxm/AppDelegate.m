//
//  AppDelegate.m
//  meetxm
//
//  Created by 岳青山 on 15/5/3.
//  Copyright (c) 2015年 岳青山. All rights reserved.
//

#import "AppDelegate.h"
#import "HomePage.h"
//#import <EstimoteSDK/EstimoteSDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    NSUserDefaults *userdefaults=[NSUserDefaults standardUserDefaults];
    
    [userdefaults setObject:@"0" forKey:@"atBackground"];
    
    if(![UIDevice currentDevice].multitaskingSupported)
    {
        //不支持多任务时应做的处理
        NSLog(@"不支持多任务时应做的处理");
    }
    
    
    
    
//    float sysVersion=[[UIDevice currentDevice]systemVersion].floatValue;
//    if (sysVersion>=8.0) {
//        UIUserNotificationType type=UIUserNotificationTypeBadge | UIUserNotificationTypeAlert | UIUserNotificationTypeSound;
//        UIUserNotificationSettings *setting=[UIUserNotificationSettings settingsForTypes:type categories:nil];
//        [[UIApplication sharedApplication]registerUserNotificationSettings:setting];
//    }
    
    
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
//    {
//        [[UIApplication sharedApplication] registerForRemoteNotifications];
//        
//        UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeNone);
//        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes
//                                                                                 categories:nil];
//        
//        [application registerUserNotificationSettings:settings];
//    }
//    else
//    {
//        [[UIApplication sharedApplication] registerForRemoteNotificationTypes: UIRemoteNotificationTypeNone];
//    }
    
    return YES;
}



- (void)applicationDidEnterBackground:(UIApplication *)application

{
    
    NSUserDefaults *userdefaults=[NSUserDefaults standardUserDefaults];
    
    [userdefaults setObject:@"1" forKey:@"atBackground"];
    
    bgTask = [application beginBackgroundTaskWithExpirationHandler:^{
        // 10分钟后执行这里，应该进行一些清理工作，如断开和服务器的连接等
        // ...
        // stopped or ending the task outright.
        [application endBackgroundTask:bgTask];
        bgTask = UIBackgroundTaskInvalid;
    }];
    
    if (bgTask == UIBackgroundTaskInvalid) {
        NSLog(@"failed to start background task!");
    }
    
    // Start the long-running task and return immediately.
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Do the work associated with the task, preferably in chunks.
        NSTimeInterval timeRemain = 0;
        do{
            [NSThread sleepForTimeInterval:5];
            if (bgTask!= UIBackgroundTaskInvalid) {
                timeRemain = [application backgroundTimeRemaining];
                NSLog(@"Time remaining: %f",timeRemain);
            }
        }while(bgTask!= UIBackgroundTaskInvalid && timeRemain > 0); // 如果改为timeRemain > 5*60,表示后台运行5分钟
        // done!
         NSLog(@"Time remaining: %f",timeRemain);
        // 如果没到10分钟，也可以主动关闭后台任务，但这需要在主线程中执行，否则会出错
        dispatch_async(dispatch_get_main_queue(), ^{
            if (bgTask != UIBackgroundTaskInvalid)
            {
                // 和上面10分钟后执行的代码一样
                // ... 
                // if you don't call endBackgroundTask, the OS will exit your app. 
                [application endBackgroundTask:bgTask]; 
                bgTask = UIBackgroundTaskInvalid; 
            } 
        }); 
    });
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

//- (void)applicationDidEnterBackground:(UIApplication *)application {
//    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
//    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
    NSUserDefaults *userdefaults=[NSUserDefaults standardUserDefaults];
    
    [userdefaults setObject:@"0" forKey:@"atBackground"];

    
    if (bgTask!=UIBackgroundTaskInvalid) {
        [application endBackgroundTask:bgTask];
        bgTask = UIBackgroundTaskInvalid;
    }
}

/**
 * 接收到本地通知之后就会调用（点击通知后，能进入程序）程序并没有重新运行(没有退出)，还在后台运行，这样就会点击通知后调用
 */
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    //点击提示框的打开
    application.applicationIconBadgeNumber = 0;
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    //当程序还在后天运行
    application.applicationIconBadgeNumber = 0;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
