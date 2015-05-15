//
//  BroadcastSpeech.m
//  meetxm
//
//  Created by 岳青山 on 15/5/4.
//  Copyright (c) 2015年 岳青山. All rights reserved.
//

#import "BroadcastSpeech.h"
#import "MJAudioTool.h"
@interface BroadcastSpeech ()<AVAudioPlayerDelegate>
@property(nonatomic,assign)BOOL isPlaying;
@end

@implementation BroadcastSpeech

- (void)viewDidLoad {
    [super viewDidLoad];
    [super loadBarButton:3];
    
    
    
    [self.navigationController setNavigationBarHidden:NO];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playSpeech:) name:@"PlaySpeech" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(locationNotification) name:@"PushNotification" object:nil];
    
}

- (void) playSpeech:(NSNotification *)notification{
    NSDictionary *dic = [notification object];
    NSLog(@"%@",dic);
    
    if(self.isPlaying == YES){
        [MJAudioTool playMusic:@"9行李寄存区.m4a"];
        AVAudioPlayer *player =  [MJAudioTool currentPlayingAudioPlayer];
        if (!player.isPlaying) {
            [self locationNotification];
        }
    }
}

-(void) viewWillAppear:(BOOL)animated{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0){
        if ([[UIApplication sharedApplication]currentUserNotificationSettings].types==UIUserNotificationTypeNone) {
            [[UIApplication sharedApplication]registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound  categories:nil]];
        }
    }

}

-(void) locationNotification{
    NSLog(@"fss");
    UILocalNotification *local = [[UILocalNotification alloc] init];
    
    //设置属性
    //操作标题
    local.alertAction = @"友情提示";
    //2.正文
    local.alertBody = @"xxxx,要不要吃饭去";
    //图标上面的数字
    local.applicationIconBadgeNumber = 1;
    //local.userInfo = @{};
    //    local.repeatInterval = NSCalendarUnitSecond;
    //设置开启的时间
    local.fireDate = [NSDate dateWithTimeIntervalSinceNow:1];
    
    //添加（注册）通知
    UIApplication *app = [UIApplication sharedApplication];
    [app cancelAllLocalNotifications]; //清除所有通知
    [app scheduleLocalNotification:local];
}

- (IBAction)selectedAction:(UISegmentedControl *)sender
{
    //关闭
    if (sender.selectedSegmentIndex == 0) {
        self.isPlaying = NO;
        [MJAudioTool stopMusic:@"9行李寄存区.m4a"];
    }
    //自动播放
    else if (sender.selectedSegmentIndex == 1)
    {
        self.isPlaying = YES;
    }
    //摇一摇
    else if (sender.selectedSegmentIndex ==2)
    {
        self.isPlaying = NO;
    }
}
//摇一摇
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    self.isPlaying = YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [player pause];
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"PushNotification" object:nil];
    //    [self locationNotification];
    audioplayer =nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
