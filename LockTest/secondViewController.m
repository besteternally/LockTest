//
//  secondViewController.m
//  LockTest
//
//  Created by yuge on 2018/11/4.
//  Copyright © 2018 yuge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "secondViewController.h"
#import "ViewController.h"


@interface secondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textfield5;
//@property(nonatomic) ViewController *methodtip;
-(void)showSafeCode:(NSString *)tip;
@end


@implementation secondViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
     //设置电池和时间d状态栏的属性颜色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
     //设置placeholder的颜色
    self.textField1.attributedPlaceholder=[[NSAttributedString alloc]initWithString:@"hello" attributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    self.textfield5.attributedPlaceholder=[[NSAttributedString alloc]initWithString:@"-" attributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
   // self.methodtip= [[ViewController alloc]init];
    
}

-(void)showSafeCode:(NSString *)tip{
    //带文本的弹出框

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请输入安全码" message:tip preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = @"请输入安全码";
    }];
    
    //判断是不是是否输入安全码
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:/*^(UIAlertAction *quedin){
        
        [self performSegueWithIdentifier:@"control" sender:self];
    }*/nil]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:alertController animated:true completion:nil];
    
    
}

- (IBAction)unBind {
    [self showSafeCode:@"安全码"];
}

- (IBAction)lock {
    [self showSafeCode:@"安全码"];
}

- (IBAction)unLock {
    [self showSafeCode:@"安全码"];
}

@end

