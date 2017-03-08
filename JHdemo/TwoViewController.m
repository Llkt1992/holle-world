//
//  TwoViewController.m
//  JHdemo
//
//  Created by LLKT on 2017/2/12.
//  Copyright © 2017年 LLKT. All rights reserved.
// 0.0.3

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)BtnAction:(id)sender {
    NSLog(@"%@",self.textfield.text);
    // 通知
//    NSDictionary *dic = @{@"text":self.textfield.text};
    
//    NSNotification *notif = [NSNotification notificationWithName:@"tongzhi" object:nil userInfo:dic];
//    [[NSNotificationCenter defaultCenter] postNotification:notif];
    
    
    // block
//    if (self.block != nil) {
//        self.block(self.textfield.text);
//    }
    
    // 协议
    if (self.delegate && [self.delegate respondsToSelector:@selector(returnText:)]) {
        [self.delegate returnText:self.textfield.text];
    }
    
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)returnText:(ReturnTextBlock)block
{
    self.block = block;
}

@end
