//
//  SHQLinkViewcontroller.m
//  iOSPro
//
//  Created by Tom on 2018/3/9.
//  Copyright © 2018年 Tom. All rights reserved.
//

#import "SHQLinkViewcontroller.h"
#import <MOFSPickerManager.h>


@interface SHQLinkViewcontroller ()

@property (nonatomic,strong)UIButton *selectBtn;

@end

@implementation SHQLinkViewcontroller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.selectBtn];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)title
{
    return @"123";
}

-(UIColor *)lmjNavigationBackgroundColor:(LMJNavigationBar *)navigationBar
{
    return [UIColor RandomColor];
}

- (UIImage *)lmjNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(LMJNavigationBar *)navigationBar
{
    return [UIImage imageNamed:@"navigationButtonReturnClick"];
}

- (UIImage *)lmjNavigationBarRightButtonImage:(UIButton *)rightButton navigationBar:(LMJNavigationBar *)navigationBar
{
    rightButton.backgroundColor = [UIColor RandomColor];
    
    return nil;
}

-(void)leftButtonEvent:(UIButton *)sender navigationBar:(LMJNavigationBar *)navigationBar
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIButton *)selectBtn
{
    LMJWeakSelf(self);
    if (!_selectBtn) {
        _selectBtn = [UIButton initWithFrame:CGRectMake(0, self.lmj_navgationBar.bottom+20, kScreenWidth, 44) buttonTitle:@"收货地址" normalBGColor:[UIColor whiteColor] selectBGColor:[UIColor whiteColor] normalColor:[UIColor blackColor] selectColor:[UIColor whiteColor] buttonFont:[UIFont systemFontOfSize:14.0] cornerRadius:2.0 doneBlock:^(UIButton *btn) {
            [[MOFSPickerManager shareManger] showMOFSAddressPickerWithTitle:@"" cancelTitle:@"取消" commitTitle:@"确定" commitBlock:^(NSString *address, NSString *zipcode) {
                
            } cancelBlock:^{
                
            }];
        }];
    }
    return _selectBtn;
}

@end
