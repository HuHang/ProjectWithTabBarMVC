//
//  LoginViewController.m
//  WTSProject
//
//  Created by Charlot on 2017/3/27.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import "LoginViewController.h"
#import "TabBarViewController.h"
#import "IPSettingViewController.h"
#import "AppDelegate.h"
#import "Base64.h"



@interface LoginViewController ()
@property (nonatomic,strong)UITextField *userNameTextField;
@property (nonatomic,strong)UITextField *passWordTextField;
@property (nonatomic,strong)UIButton *loginButton;
@property (nonatomic,strong)UIActivityIndicatorView *loginActivityIndicator;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = WTSBlueColor;
    [self viewLayout];
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - view
- (void)viewLayout{
    //输入框
    UILabel *usernameLeft = [UILabel labelWithString:FontAweStr(FAIconUser)
                                   withTextAlignment:(NSTextAlignmentCenter)
                                       withTextColor:[UIColor whiteColor]
                                            withFont:FontAweStrFont(20)];
    UILabel *passwordLeft = [UILabel labelWithString:FontAweStr(FAIconLock)
                                   withTextAlignment:(NSTextAlignmentCenter)
                                       withTextColor:[UIColor whiteColor]
                                            withFont:FontAweStrFont(20)];
    
    usernameLeft.frame = CGRectMake(0, 0, 30, 30);
    passwordLeft.frame = usernameLeft.frame;
    
    UIImageView *logoImage = [[UIImageView alloc] init];
    self.userNameTextField = [UITextField textFieldWithPlaceholder:@"输入账号"
                                                 withTextAlignment:(NSTextAlignmentLeft)
                                                     withTextColor:[UIColor whiteColor]
                                                          withFont:SystemFont(14.f)
                                                      withLeftView:usernameLeft
                                                     withRightView:nil];
    UIView *lineView01 = [self viewWithColor:UIColorFromHEX(0xD9D9D9,1.0)];
    self.passWordTextField = [UITextField textFieldWithPlaceholder:@"输入密码"
                                                 withTextAlignment:(NSTextAlignmentLeft)
                                                     withTextColor:[UIColor whiteColor]
                                                          withFont:SystemFont(14.f)
                                                      withLeftView:passwordLeft
                                                     withRightView:nil];
    UIView *lineView02 = [self viewWithColor:UIColorFromHEX(0xD9D9D9,1.0)];


    // 记住密码
    UIButton *savePwdBtn = [UIButton buttonWithBackgroundColor:[UIColor clearColor]
                                               withNormalImage:@"icon_circle"
                                             withSelectedImage:@"icon_point" ];
    savePwdBtn.selected = [[NSUserDefaults standardUserDefaults]boolForKey:SAVE_PWD];
    [savePwdBtn addTarget:self action:@selector(savePwd:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *savePwdLabel = [UILabel labelWithString:@"记住密码"
                                   withTextAlignment:(NSTextAlignmentLeft)
                                       withTextColor:UIColorFromHEX(0xD9D9D9,1.0)
                                            withFont:SystemFont(10.f)];
    
    
    //登录按钮
    self.loginButton = [UIButton buttonWithString:@"登 录"
                              withBackgroundColor:UIColorFromHEX(0xF0FFFF,1.0)
                                withTextAlignment:NSTextAlignmentCenter
                                    withTextColor:WTSBlueColor
                                         withFont:SystemFont(20.f)];
    
    
    
    UILabel *title = [UILabel labelWithString:@"OTWS"
                            withTextAlignment:NSTextAlignmentCenter
                                withTextColor:[UIColor whiteColor]
                                     withFont:SystemFont(22)];
    UILabel *subTitle = [UILabel labelWithString:@"订单运输仓储系统"
                               withTextAlignment:NSTextAlignmentCenter
                                   withTextColor:[UIColor whiteColor]
                                        withFont:SystemFont(16)];
    
    UIButton *settingButton = [UIButton buttonWithString:@"设置"
                                     withBackgroundImage:nil
                                     withBackgroundColor:[UIColor clearColor]
                                       withTextAlignment:NSTextAlignmentCenter
                                           withTextColor:UIColorFromHEX(0xD9D9D9,1.0)
                                                withFont:14];
    
    
    [self.view addSubview:logoImage];
    [self.view addSubview:title];
    [self.view addSubview:subTitle];
    [self.view addSubview:self.userNameTextField];
    [self.view addSubview:self.passWordTextField];
    [self.view addSubview:self.loginButton];
    [self.view addSubview:settingButton];
    [self.view addSubview:lineView01];
    [self.view addSubview:lineView02];
    [self.view addSubview:savePwdBtn];
    [self.view addSubview:savePwdLabel];


    //logo
    [logoImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(64);
        make.width.and.height.mas_equalTo(86);
    }];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(logoImage);
        make.top.equalTo(logoImage.mas_bottom).with.mas_offset(16);
        make.size.mas_equalTo(CGSizeMake(100, 36));
    }];
    
    [subTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(title);
        make.top.equalTo(title.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(174, 34));
    }];
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = CGRectMake(0, 0, logoImage.frame.size.width, logoImage.frame.size.height);
    [logoImage addSubview:effectView];
    
    //用户名 密码
    [self.userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_centerY).with.mas_offset(30);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(30);
    }];
    [lineView01 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userNameTextField).with.mas_offset(25);
        make.height.mas_equalTo(1);
        make.right.equalTo(self.userNameTextField);
        make.top.equalTo(self.userNameTextField.mas_bottom);
    }];
    
    [self.passWordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.centerX.equalTo(self.userNameTextField);
        make.top.equalTo(self.userNameTextField.mas_bottom).with.mas_offset(20);
    }];
    [lineView02 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.left.equalTo(lineView01);
        make.top.equalTo(self.passWordTextField.mas_bottom);
    }];
    
    //记住密码
    [savePwdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.top.equalTo(lineView02.mas_bottom).with.mas_offset(20);
        make.left.equalTo(self.passWordTextField);
    }];
    [savePwdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.and.top.equalTo(savePwdBtn);
        make.left.equalTo(lineView02);
        make.width.mas_equalTo(100);
    }];
    
    //设置ip
    [settingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).with.mas_offset(-5);
        make.size.mas_equalTo(CGSizeMake(70, 30));
    }];
    
    //登录
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 44));
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(settingButton.mas_top).with.offset(-35);
    }];
    
    
    
    
    logoImage.image = [UIImage imageNamed:@"icon_logo"];
    
    self.passWordTextField.secureTextEntry = YES;
     [self.userNameTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
     [self.passWordTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    self.loginButton.layer.cornerRadius = 22;
    self.loginButton.layer.borderColor= [UIColor whiteColor].CGColor;
    self.loginButton.layer.masksToBounds = YES;
    
    [self.loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [settingButton addTarget:self action:@selector(ipSetting) forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark - loadData
- (void)initData{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:SAVE_PWD]) {
        self.userNameTextField.text = [[NSUserDefaults standardUserDefaults] valueForKey:USERNAME];
        self.passWordTextField.text = [[NSUserDefaults standardUserDefaults] valueForKey:PASSWORD];
    }
}
#pragma mark - http


#pragma mark - action
-(void)savePwd:(UIButton *)button{
    button.selected = !button.selected;
    [[NSUserDefaults standardUserDefaults]setBool:button.selected forKey:SAVE_PWD];
    [[NSUserDefaults standardUserDefaults]synchronize];

    
}

- (void)login:(UIButton *)sender{
    [self reSetRootView];
//    if (self.userNameTextField.text.length == 0 || self.passWordTextField.text.length == 0) {
//        [PCMBProgressHUD showLoadingTipsInView:self.view title:@"请输入完整的账号密码" detail:nil withIsAutoHide:YES];
//    }else{
//        self.loginActivityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
//        self.loginActivityIndicator.center = CGPointMake(30.0f, 22.0f);
//        [sender addSubview:self.loginActivityIndicator];
//        self.loginActivityIndicator.color = WTSBlueColor;
//        [self.loginActivityIndicator startAnimating];
//        [self.loginActivityIndicator setHidesWhenStopped:YES];
//    }
}

- (void)ipSetting{
    IPSettingViewController *ipSet = [[IPSettingViewController alloc] init];
    [self presentViewController:ipSet animated:YES completion:nil];
}
- (void)successForLogin:(NSString *)key value:(NSString *)value{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if ([user boolForKey:SAVE_PWD]) {
        [user setObject:key forKey:USERNAME];
        [user setObject:value forKey:PASSWORD];
    }else{
        [user setObject:key forKey:USERNAME];
        [user setObject:@"" forKey:PASSWORD];
    }
    NSString *kerWithValue = [NSString stringWithFormat:@"%@:%@",key,value];
    NSString *basicAuth = [NSString stringWithFormat:@"Basic %@",[kerWithValue base64EncodedString]];
    [user setObject:basicAuth forKey:Basic_Auth];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.loginActivityIndicator stopAnimating];
    [self performSelector:@selector(reSetRootView) withObject:nil afterDelay:0.3];
    
}
- (void)reSetRootView{
     typedef void (^Animation)(void);
    self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    TabBarViewController *mainView = [[TabBarViewController alloc]init];
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    Animation animation = ^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        app.window.rootViewController = mainView;
        [UIView setAnimationsEnabled:oldState];
    };
    
    [UIView transitionWithView:app.window
     
                      duration:0.9f
     
                       options:UIViewAnimationOptionTransitionFlipFromRight
     
                    animations:animation
     
                    completion:nil];
    
    
}

- (void)dealloc{
    HHCodeLog(@"dealloc");
}
#pragma mark 懒加载
- (UIView *)viewWithColor:(UIColor *)viewColor {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = viewColor;
    return view;
}

@end
