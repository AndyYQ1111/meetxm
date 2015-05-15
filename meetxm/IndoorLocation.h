//
//  IndoorLocation.h
//  meetxm
//
//  Created by 岳青山 on 15/5/12.
//  Copyright (c) 2015年 岳青山. All rights reserved.
//

#import "BaseViewController.h"

#import "ESTLocation.h"
#import "ESTIndoorLocationView.h"

@interface IndoorLocation : BaseViewController

@property (nonatomic, strong) IBOutlet ESTIndoorLocationView *indoorLocationView;
@property (nonatomic, strong) IBOutlet UISwitch *showTraceSwitch;
@property (nonatomic, strong) IBOutlet UISwitch *rotateOnUpdateSwitch;

@property (nonatomic, strong) IBOutlet UILabel *positionLabel;

- (instancetype)initWithLocation:(ESTLocation *)location;

@end
