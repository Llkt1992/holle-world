//
//  TwoViewController.h
//  JHdemo
//
//  Created by LLKT on 2017/2/12.
//  Copyright © 2017年 LLKT. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ReturnTextBlock)(NSString *string);
@protocol TwoViewControllerDelegate <NSObject>

- (void)returnText:(NSString *)string;

@end
@interface TwoViewController : UIViewController<TwoViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (nonatomic , copy) ReturnTextBlock block;
@property (nonatomic , assign)id<TwoViewControllerDelegate>delegate;


- (void)returnText:(ReturnTextBlock)block;
@end
