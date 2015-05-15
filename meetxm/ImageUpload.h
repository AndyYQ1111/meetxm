//
//  ImageUpload.h
//  FileUpLoadProgress
//
//  Created by guan song on 14/12/25.
//  Copyright (c) 2014年 guan song. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageUpload : NSObject
@property(nonatomic,strong)NSString *urlstr;
+(void) fileUploadWith:(NSData *)data;
@end
