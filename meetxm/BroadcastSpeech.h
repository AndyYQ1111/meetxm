//
//  BroadcastSpeech.h
//  meetxm
//
//  Created by 岳青山 on 15/5/4.
//  Copyright (c) 2015年 岳青山. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface BroadcastSpeech : BaseViewController
{
    AVAudioPlayer *audioplayer;
    NSString *majorStr;
    NSMutableArray *majorArr;
}

@end
