//
//  RegisterViewController.m
//  HelloWorld
//
//  Created by strive cheng on 2018/5/4.
//  Copyright © 2018年 rbl. All rights reserved.
//

#import "RegisterViewController.h"

#define kMarginLeft 40.f
#define kTextFieldWidth CGRectGetWidth([UIScreen mainScreen].bounds)-2*kMarginLeft
#define kTextFieldHeight 40.f




@interface RegisterViewController ()

@property (nonatomic,strong) UIButton *backBtn;
@property (nonatomic,strong) UIButton *registerBtn;
@property (nonatomic,strong) UITextField *nationField;
@property (nonatomic,strong) UITextField *passwordField;
@property (nonatomic,strong) UITextField *phoneField;
@property (nonatomic,strong) UITextField *areaCodeField;
@property (nonatomic,strong) UITextField *verificationCodeField;
@property (nonatomic,strong) UIButton *moreOptionBtn;
@property (nonatomic,strong) UIButton *verificationBtn;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupView];
    
}

- (void) setupView{
    
    [self.view addSubview:self.backBtn];
    [self.view addSubview:self.nationField];
    [self addHorizontalLineView: CGRectMake(kMarginLeft,  self.nationField.frame.origin.y+self.nationField.frame.size.height+1,self.nationField.frame.size.width, 1)];
    [self.view addSubview:self.phoneField];
    [self addHorizontalLineView: CGRectMake(kMarginLeft,  self.phoneField.frame.origin.y+self.phoneField.frame.size.height+1,self.phoneField.frame.size.width, 1)];
    [self.view addSubview:self.verificationCodeField];
    [self.view addSubview:self.verificationBtn];
    [self addHorizontalLineView: CGRectMake(kMarginLeft,  self.verificationCodeField.frame.origin.y+self.verificationCodeField.frame.size.height+1,self.verificationCodeField.frame.size.width, 1)];
    [self.view addSubview:self.passwordField];
    [self addHorizontalLineView: CGRectMake(kMarginLeft,  self.passwordField.frame.origin.y+self.passwordField.frame.size.height+1,self.passwordField.frame.size.width, 1)];
    
    [self.view addSubview:self.registerBtn];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 添加水平线
 */
- (void) addHorizontalLineView : (CGRect)frame {
    UIView *lineView = [[UIView alloc] initWithFrame: frame];
    [lineView setBackgroundColor: [UIColor colorWithRed: 64/255.0 green: 156/255.0 blue: 240/255.0 alpha:0.7f]];
    [self.view addSubview:lineView];
}

- (UIButton *)backBtn {
    _backBtn = [UIButton buttonWithType: UIButtonTypeSystem];
    _backBtn.frame = CGRectMake(20, 40, 40, 20);
    [_backBtn setTitle: @"返回" forState: UIControlStateNormal];
    [_backBtn addTarget:self action: @selector(back) forControlEvents: UIControlEventTouchUpInside];
    
    return _backBtn;
}

- (UITextField *)nationField {
    if (_nationField==nil) {
        _nationField = [[UITextField alloc] initWithFrame: CGRectMake(kMarginLeft, 100,  kTextFieldWidth, kTextFieldHeight)];
        _nationField.text = @"中国";
        _nationField.leftViewMode =UITextFieldViewModeAlways;
        UIImageView *leftView=[[UIImageView alloc]initWithImage: [UIImage imageNamed: @"location"]];
        leftView.frame = CGRectMake(0.0, 0.0, leftView.image.size.width+15.0, leftView.image.size.height);
        leftView.contentMode = UIViewContentModeCenter;
        _nationField.leftViewMode = UITextFieldViewModeAlways;
        _nationField.leftView =leftView;
    }
    return _nationField;
}

- (UITextField *) phoneField{
    if (!_phoneField) {
        _phoneField = [[UITextField alloc]initWithFrame: CGRectMake(kMarginLeft,_nationField.frame.origin.y + _nationField.frame.size.height+40, kTextFieldWidth, kTextFieldHeight)];
        _phoneField.placeholder = @"手机号";
        _phoneField.font = [UIFont boldSystemFontOfSize: 16.0];
        _phoneField.autocorrectionType = UITextAutocorrectionTypeNo;
        _phoneField.clearButtonMode = UITextFieldViewModeAlways;
        UIImageView *leftView=[[UIImageView alloc]initWithImage: [UIImage imageNamed: @"mobile_phone"]];
        leftView.frame = CGRectMake(0.0, 0.0, leftView.image.size.width+15.0, leftView.image.size.height);
        leftView.contentMode = UIViewContentModeCenter;
        _phoneField.leftViewMode = UITextFieldViewModeAlways;
        _phoneField.leftView =leftView;
        //    [phoneField addTarget: self action: @selector(selector) forControlEvents: UIControlEventEditingChanged];
        
    }
    return  _phoneField;
}




- (UITextField *) verificationCodeField{
    if (!_verificationCodeField) {
        _verificationCodeField = [[UITextField alloc]initWithFrame: CGRectMake(kMarginLeft,_phoneField.frame.origin.y+_phoneField.frame.size.height+40, 200, kTextFieldHeight)];
        [_verificationCodeField setPlaceholder:@"验证码"];
        _verificationCodeField.font = [UIFont systemFontOfSize: 16.0];
        _verificationCodeField.autocorrectionType = UITextAutocapitalizationTypeWords;
        _verificationCodeField.clearButtonMode = UITextFieldViewModeAlways;
        _verificationCodeField.leftViewMode = UITextFieldViewModeAlways;
        UIImageView *psLeftView=[[UIImageView alloc]initWithImage: [UIImage imageNamed: @"verification_code"]];
        psLeftView.frame = CGRectMake(0.0, 0.0, psLeftView.image.size.width+15.0, psLeftView.image.size.height);
        psLeftView.contentMode = UIViewContentModeCenter;
        _verificationCodeField.leftView = psLeftView;
    }
    return _verificationCodeField;
}

- (UIButton *) verificationBtn{
    if (!_verificationBtn) {
        _verificationBtn = [UIButton buttonWithType: UIButtonTypeSystem];
        _verificationBtn.frame =CGRectMake( _verificationCodeField.frame.origin.x + _verificationCodeField.frame.size.width, _phoneField.frame.origin.y+_phoneField.frame.size.height+40 , 100, 40);
        [_verificationBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_verificationBtn addTarget: self action: @selector( getVerification) forControlEvents: UIControlEventTouchUpInside];
        _verificationBtn.layer.cornerRadius = 5.f;
        _verificationBtn.layer.shadowRadius = 5.f;
        _verificationBtn.layer.shadowColor =[UIColor colorWithRed: 64/255.0 green: 156/255.0 blue: 240/255.0 alpha:1.0f].CGColor;
    }
    return  _verificationBtn;
}

- (UITextField *) passwordField{
    if (!_passwordField) {
        _passwordField = [[UITextField alloc]initWithFrame: CGRectMake(kMarginLeft,_verificationCodeField.frame.origin.y + _verificationCodeField.frame.size.height+40,  kTextFieldWidth, kTextFieldHeight)];
        [_passwordField setPlaceholder:@"密码"];
        _passwordField.font = [UIFont systemFontOfSize: 16.0];
        _passwordField.autocorrectionType = UITextAutocapitalizationTypeWords;
        _passwordField.clearButtonMode = UITextFieldViewModeAlways;
        _passwordField.secureTextEntry = YES;
        _passwordField.leftViewMode = UITextFieldViewModeAlways;
        UIImageView *psLeftView = [[UIImageView alloc]initWithImage: [UIImage imageNamed: @"password"]];
        psLeftView.frame = CGRectMake(0.0, 0.0, psLeftView.image.size.width+15.0, psLeftView.image.size.height);
        psLeftView.contentMode = UIViewContentModeCenter;
        _passwordField.leftView = psLeftView;
    }
    return _passwordField;
}

- (UIButton *) registerBtn{
    _registerBtn = [UIButton buttonWithType: UIButtonTypeSystem];
    _registerBtn.frame = CGRectMake( kMarginLeft,_passwordField.frame.origin.y +_passwordField.frame.size.height+40, kTextFieldWidth, kTextFieldHeight);
    [_registerBtn setTitle: @"注册" forState: UIControlStateNormal];
    _registerBtn.titleLabel.font = [UIFont systemFontOfSize:19];
    [_registerBtn setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
    _registerBtn.layer.cornerRadius = 5.f;
    _registerBtn.backgroundColor = [UIColor colorWithRed: 64/255.0 green: 156/255.0 blue: 240/255.0 alpha:1.0f];
    [_registerBtn addTarget: self action: @selector(startRegister) forControlEvents: UIControlEventTouchUpInside];
    
    return  _registerBtn;
}


- (void) back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//获取验证码
- (void) getVerification{
    NSString *phone = self.phoneField.text;
    if (phone.length==0) {
        UIAlertController *alertController=[UIAlertController alertControllerWithTitle: @"提示" message: @"手机号不能为空" preferredStyle: UIAlertControllerStyleAlert];
        [alertController addAction: [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler: nil]];
        [self presentViewController: alertController animated: YES completion: nil];
        
    }else{
        UIAlertController *alertController=[UIAlertController alertControllerWithTitle: @"提示" message: @"验证码为1234" preferredStyle: UIAlertControllerStyleAlert];
        [alertController addAction: [UIAlertAction actionWithTitle: @"知道了" style: UIAlertActionStyleDefault handler: nil]];
        //修改message字体大小
        NSMutableAttributedString *alertControllerMessageStr = [[NSMutableAttributedString alloc] initWithString:@"验证码为1234"];
        [alertControllerMessageStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, 4)];
        [alertController setValue:alertControllerMessageStr forKey:@"attributedMessage"];
        //    [alert addAction: [UIAlertAction actionWithTitle: @"确认" style: UIAlertActionStyleDestructive handler: nil]];
        //    [alert addAction: [UIAlertAction actionWithTitle: @"取消" style: UIAlertActionStyleCancel handler: nil]];
        [self presentViewController: alertController animated: YES completion: nil];
    }
}


//开始注册
- (void) startRegister{
    NSString *phone = self.phoneField.text;
    NSString *verifiCode = self.verificationCodeField.text;
    NSString *password = self.passwordField.text;
    UIAlertController *alertController;
    if (verifiCode.length==0) {
        alertController=[UIAlertController alertControllerWithTitle: @"提示" message: @"验证码不能为空" preferredStyle: UIAlertControllerStyleAlert];
        [alertController addAction: [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler: nil]];
        [self presentViewController: alertController animated: YES completion: nil];
        
    }else if(![verifiCode isEqualToString:@"1234"]){
        alertController=[UIAlertController alertControllerWithTitle: @"提示" message: @"验证码输入不正确" preferredStyle: UIAlertControllerStyleAlert];
        [alertController addAction: [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler: nil]];
        [self presentViewController: alertController animated: YES completion: nil];
    }else if(password.length==0){
        alertController=[UIAlertController alertControllerWithTitle: @"提示" message: @"密码不能为空" preferredStyle: UIAlertControllerStyleAlert];
        [alertController addAction: [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler: nil]];
        [self presentViewController: alertController animated: YES completion: nil];
        
    }else{
        if ([self.delegate respondsToSelector:@selector(registerPhoneNumber:password:)]) {
            [self.delegate registerPhoneNumber: phone password: password];
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}

@end
