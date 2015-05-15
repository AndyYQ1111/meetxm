//
//  ImageUpload.m
//  FileUpLoadProgress
//
//  Created by guan song on 14/12/25.
//  Copyright (c) 2014年 guan song. All rights reserved.
//

#import "ImageUpload.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
static int i = 0;
@implementation ImageUpload
+(void) fileUploadWith:(NSData *)data
{
    

    
        NSString * fileName =[NSString stringWithFormat:@"%d.jpg", i+1];
    
        // 1. 创建一个 `AFHTTPRequestSerializer`，利用此对象可以创建一个request请求.
        AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
        NSError * err = nil;
        // 2. 获取一个`NSMutableURLRequest`对象.
        NSMutableURLRequest *request =
        [serializer multipartFormRequestWithMethod:@"POST"//请求方法为post
                                         URLString:@"http://www.xmlyt.cn/ajax/Statistics.ashx?sn=addUserPic"//上传文件URL
                                        parameters:nil//上传的其他参数
                         constructingBodyWithBlock:^(id<AFMultipartFormData> formData)//设置请求体
         {
             
             [formData appendPartWithFileData:data//音乐媒体文件的data对象
                                         name:@"file1"//与数据关联的参数名称，不能为nil
                                     fileName:fileName//上传的文件名，不能为nil
                                     mimeType:@"image/jpeg"];//MIME类型(例如：图片为 image/jpeg.) 可以参照 http://www.iana.org/assignments/media-types/. ，不能为nil
         } error:&err];//playerError为错误对象
        // 3. 创建并使用 `AFHTTPRequestOperationManager`，然后创建一个异步请求操作对象`AFHTTPRequestOperation`，这个对象执行时会发送刚刚创建的`NSMutableURLRequest`请求.
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        AFHTTPRequestOperation *operation =
        [manager HTTPRequestOperationWithRequest:request
                                         success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                             NSLog(@"Success %@", responseObject);//上传成功后的语句块
                                             NSDictionary *dic = (NSDictionary *)responseObject[@"result"];
                                             NSString *str = dic[@"QRCODE"];
                                             NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                                             [defaults setObject:str forKey:@"images"];
                                             [defaults synchronize];
                                
//                                             vC.imgV.image =[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:str]]];
//                                             vC.urlstr = dic[@"QRCODE"];
//                                             [vC.imgu
//                                              sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:nil];
//                                            NSLog(@"urlstr-++++-====-----%@",str);
                                         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                             NSLog(@"%@",error);
                                             NSString * str  = operation.responseString;
                                             NSLog(@"%@", operation.responseString);
                                             error = nil;
                                             str = @"{\"msg\":1}";
                
                                             
                                             NSLog(@"Failure %@", error.description);//上传失败的语句块
                                         }];
        
               //5. 开始上传任务
        [operation start];

    }

@end
