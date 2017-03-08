//
//  ViewController.m
//  JHdemo
//
//  Created by LLKT on 2017/2/12.
//  Copyright © 2017年 LLKT. All rights reserved.
//

// 练习 代理 通知 block



#import "ViewController.h"
#import "TwoViewController.h"


@interface ViewController ()<TwoViewControllerDelegate>
@property (nonatomic , strong)UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUI];
    
    // 注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tongzhiAciton:) name:@"tongzhi" object:nil];
    
}


- (void)tongzhiAciton:(NSNotification *)notifi
{
    _label.text = notifi.userInfo[@"text"];
}

- (void)setUI
{
        // 创建一个uilable
    _label = [[UILabel alloc] initWithFrame:CGRectMake(200, 200, 200, 50)];
    _label.textColor = [UIColor redColor];
    _label.font =[UIFont systemFontOfSize:20];
//    _label.text = @"123";
    [self.view addSubview:_label];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, _label.frame.origin.y + 220, 200, 200);
    [button setTitle:@"跳转" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)buttonAction:(UIButton *)btn
{
    TwoViewController *twoVC = [[TwoViewController alloc] initWithNibName:@"TwoViewController" bundle:nil];
    
    
    [twoVC returnText:^(NSString *string) {
        _label.text = string;
    }];
    twoVC.delegate = self;
    
    
    [self.navigationController pushViewController:twoVC animated:YES];
}

- (void)returnText:(NSString *)string
{
    _label.text = string;
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
