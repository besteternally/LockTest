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
#import "AppDelegate.h"


@interface secondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textfield5;
//@property(nonatomic) ViewController *methodtip;
@property (weak,nonatomic)UIAlertController *alertController;
-(void)showSafeCodeWithTip:(NSString *)tip method:(void(^)(UIAlertAction *))check;
-(BOOL)checksafecode:(NSString *)inputsafecode;

@end


@implementation secondViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
     //设置电池和时间d状态栏的属性颜色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
     //设置placeholder的颜色
//    self.textField1.attributedPlaceholder=[[NSAttributedString alloc]initWithString:@"hello" attributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    
    //初始化门锁状态
    //AppDelegate *checklock=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    //NSString *initlockstate=checklock.lockstate;
    self.textfield5.attributedPlaceholder=[[NSAttributedString alloc]initWithString:@"lock" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    NSString *path=[[NSBundle mainBundle]pathForResource:@"data" ofType:@"plist"];
    NSDictionary *userlist=[NSDictionary dictionaryWithContentsOfFile:path];
    if(userlist!=nil){
        _textField1.text=userlist[@"UserName"];
    }
}

//
-(BOOL)checksafecode:(NSString *)inputsafecode{
    AppDelegate *staticSafeCode=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    if([inputsafecode isEqualToString:staticSafeCode.safecode]){
        return YES;
    }
    else{
        return NO;
    }
}
-(void)showSafeCodeWithTip:(NSString *)tip method:(void(^)(UIAlertAction *))check{
    //带文本的弹出框
    self.alertController = [UIAlertController alertControllerWithTitle:tip message:@"安全码" preferredStyle:UIAlertControllerStyleAlert];
    [self.alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = @"请输入安全码";
    }];
    
    //判断是不是是否输入安全码
    [self.alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:check]];
    [self.alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:self.alertController animated:true completion:nil];
    
    
}

- (IBAction)unBind {
    [self showSafeCodeWithTip:@"请输入安全码解绑" method:^(UIAlertAction *check){
        //先检验安全码是不是输入正确；
        BOOL safeOrNot=[self checksafecode:[self.alertController textFields][0].text];
        if(safeOrNot){
            NSString *path=[[NSBundle mainBundle]pathForResource:@"data" ofType:@"plist"];
            NSMutableDictionary *userlist=[NSMutableDictionary dictionaryWithContentsOfFile:path];
            [userlist removeAllObjects];
            [userlist writeToFile:path atomically:YES];
            NSLog(@"删除保存的用户信息");
            exit(0);
        }
        else{
            UIAlertController *error=[UIAlertController alertControllerWithTitle:@"安全码错误！" message:nil preferredStyle:UIAlertControllerStyleAlert];
            [error addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:error animated:true completion:nil];
        }
    }];
}
- (IBAction)lock {
    [self showSafeCodeWithTip:@"请输入安全码上锁" method:^(UIAlertAction *check) {
         BOOL safeOrNot=[self checksafecode:[self.alertController textFields][0].text];
        if(safeOrNot){
            self.textfield5.text=@"lock";
        }
        else{
            UIAlertController *error=[UIAlertController alertControllerWithTitle:@"安全码错误！" message:nil preferredStyle:UIAlertControllerStyleAlert];
            [error addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:error animated:true completion:nil];
        }
    }];
}
- (IBAction)unlock {
    [self showSafeCodeWithTip:@"请输入安全码上锁" method:^(UIAlertAction *check) {
        BOOL safeOrNot=[self checksafecode:[self.alertController textFields][0].text];
        if(safeOrNot){
            self.textfield5.text=@"unlock";
            self.textfield5.text=@"unlock";
        }
        else{
            UIAlertController *error=[UIAlertController alertControllerWithTitle:@"安全码错误！" message:nil preferredStyle:UIAlertControllerStyleAlert];
            [error addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:error animated:true completion:nil];
        }
    }];
}


@end

