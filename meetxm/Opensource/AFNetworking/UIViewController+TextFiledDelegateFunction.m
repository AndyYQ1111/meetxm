//
//  UIViewController+TextFiledDelegateFunction.m
//  ControlManageSystemProject
//
//  导入此文件可以避免键盘弹出时不会遮挡文本框，仅适用于登录页
//  Created by guan song on 14-7-28.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import "UIViewController+TextFiledDelegateFunction.h"

@implementation UIViewController (TextFiledDelegateFunction)
//static float heightKey,texty,win_height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
-(void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UITextFieldTextDidBeginEditingNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}
-(void)viewDidAppear:(BOOL)animated
{
    [self traverseAllSubviews:self.view];
    //增加监听,textfield开始编辑时候的消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldBeginEditing:)name:UITextFieldTextDidBeginEditingNotification object:nil];
    
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:)name:UIKeyboardWillShowNotification object:nil];
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:)name:UIKeyboardWillHideNotification object:nil];
    
    //点击屏幕的任意位置自动回收键盘
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];
}
/**
 *隐藏键盘的方法
 */
-(void)keyboardHide:(UITapGestureRecognizer*)tap
{
    [self.view endEditing:YES];
}
#pragma clang diagnostic pop
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];// 放弃第一响应者。
    return YES;
}
-(void)textFieldBeginEditing:(NSNotification *)aNotification
{
    
}

-(void)textFieldEndEditing:(NSNotification *)aNotification
{
    
}
- (void)keyboardWillShow:(NSNotification *)aNotification
{

}
//当键退出时调用
- (void)keyboardWillHide:(NSNotification *)aNotification
{
    
}
/**
 *  遍历所有控件,设置textfiel控件的代理
 */
-(void)traverseAllSubviews:(UIView *)view
{
    for (UIView * view2 in view.subviews)
    {
        if ([view2 isKindOfClass:[UITextField class]])
        {
            UITextField * text = (UITextField *)view2;
            text.delegate = self;
        }
        else if (view2.subviews.count>0)
        {
            [self traverseAllSubviews:view2];
        }
    }
}



@end
