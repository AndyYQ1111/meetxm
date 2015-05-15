//
//  TourActivityCell.m
//  meetxm
//
//  Created by 岳青山 on 15/5/6.
//  Copyright (c) 2015年 岳青山. All rights reserved.
//

#import "TourActivityCell.h"

@implementation TourActivityCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"TourActivityCell" owner:self options: nil];
        if(arrayOfViews.count < 1){return nil;}
        if(![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]){
            return nil;
        }
        self = [arrayOfViews objectAtIndex:0];
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

@end
