//
//  ViewController.m
//  LockTest
//
//  Created by yuge on 2018/11/4.
//  Copyright © 2018 yuge. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textfield2;
@property (weak, nonatomic) IBOutlet UITextField *textfield3;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //设置电池和时间d状态栏的属性颜色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    //设置placeholder的颜色
   self.textField1.attributedPlaceholder=[[NSAttributedString alloc]initWithString:@"-" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];


    
}
-(void)showError:(NSString *)errorMsg{
    //定义提示对话框
    UIAlertController *alert1=[UIAlertController alertControllerWithTitle:@"提示" message:errorMsg preferredStyle:UIAlertControllerStyleAlert];
    [alert1 addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert1 animated:true completion:nil];
}

-(void)showSafeCode:(NSString *)tip{
    //带文本的弹出框
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请输入安全码" message:tip preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = @"请输入安全码";
    }];
    
    //判断是不是是否输入安全码
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *quedin){
      
        [self performSegueWithIdentifier:@"control" sender:self];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:alertController animated:true completion:nil];
    

}


- (IBAction)onClick {
    NSString *lock=[self.textfield2.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *user=[self.textfield3.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet] ];
    if([lock isEqualToString:@""]){
        [self showError:@"请输入你要绑定的门锁！"];
        return;
    }
    if ([user isEqualToString:@""]) {
        [self showError:@"请输入操作门锁的用户！"];
        return;
    }
    [self showSafeCode:@"安全码"];
   
    
    
  
    
    
   

}


- (IBAction)aa:(id)sender {
}
@end
