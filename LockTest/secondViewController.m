//
//  secondViewController.m
//  LockTest
//
//  Created by yuge on 2018/11/4.
//  Copyright © 2018 yuge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "secondViewController.h"


@interface secondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textfield5;


@end


@implementation secondViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
     //设置电池和时间d状态栏的属性颜色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
     //设置placeholder的颜色
    self.textField1.attributedPlaceholder=[[NSAttributedString alloc]initWithString:@"hello" attributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    self.textfield5.attributedPlaceholder=[[NSAttributedString alloc]initWithString:@"-" attributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    
}

@end

