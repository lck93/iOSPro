//
//  NoBarBackController.m
//  iOSPro
//
//  Created by Tom on 2018/3/13.
//  Copyright © 2018年 Tom. All rights reserved.
//

#import "NoBarBackController.h"
#import "LMJWebViewController.h"

@interface NoBarBackController ()

@property (nonatomic,strong)UIButton *pushBtn;

@end

@implementation NoBarBackController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self pushBtn];
    self.pushBtn.lmj_y = 100;
    self.pushBtn.centerY = 100;
    self.pushBtn.centerX = self.view.centerX;
    self.pushBtn.height = 100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)navUIBaseViewControllerIsNeedNavBar:(LMJNavUIBaseViewController *)navUIBaseViewController
{
    return NO;
}

- (UIButton *)pushBtn
{
    if(_pushBtn == nil)
    {
        LMJWeakSelf(self);
        UIButton *btn = [UIButton initWithFrame:CGRectZero buttonTitle:@"点击跳转到一个不能全局返回的控制器" normalBGColor:[UIColor RandomColor] selectBGColor:[UIColor RandomColor] normalColor:[UIColor RandomColor] selectColor:[UIColor RandomColor] buttonFont:AdaptedFontSize(15) cornerRadius:5 doneBlock:^(UIButton *button) {
            
            LMJWebViewController *webVc = [[LMJWebViewController alloc] init];
            webVc.gotoURL = @"https://www.baidu.com";
            
            [weakself.navigationController pushViewController:webVc animated:YES];
            
        }];
        
        [self.view addSubview:btn];
        [btn sizeToFit];
        
        _pushBtn = btn;
        
    }
    return _pushBtn;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
