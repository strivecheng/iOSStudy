//
//  ViewController.m
//  HelloWorld
//
//  Created by strive cheng on 2018/4/4.
//  Copyright © 2018年 rbl. All rights reserved.
//  单行注释：在方法的地方按 Command+/
//  标注的功能，快捷键是Command + Option + /
// zd 无符号整形

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "MainViewController.h"



#define kMarginLeft 40.f
#define kTextFieldWidth CGRectGetWidth([UIScreen mainScreen].bounds)-2*kMarginLeft
#define kTextFieldHeight 40.f


@interface LoginViewController ()<RegisterViewControllerDelegete>{
    
}


@property (nonatomic,strong) UIImageView *bgImage;
@property (nonatomic,strong) UITextField *nationField;
@property (nonatomic,strong) UITextField *passwordField;
@property (nonatomic,strong) UITextField *phoneField;
@property (nonatomic,strong) UIButton *registerBtn;
@property (nonatomic,strong) UIButton *loginBtn;
@property (nonatomic,strong) UIButton *forgetPasswordbtn;
@property (weak, nonatomic) IBOutlet UIImageView *gifImage;




@end


@implementation LoginViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupView];
    
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGPoint centerPoint = CGPointMake(screenRect.size.width / 2.0, screenRect.size.height / 2.0);
    
    UIButton *okButton = [UIButton buttonWithType:UIButtonTypeSystem];
    okButton.frame = CGRectMake(0, 0, 80, 40);
    centerPoint.y += 100;
    okButton.center = centerPoint;
    [okButton setTitle:@"OK" forState:UIControlStateNormal];
    [okButton addTarget: self action: @selector(loginClick) forControlEvents: UIControlEventTouchUpInside];
    
    okButton.layer.borderColor = [UIColor blackColor].CGColor;
    okButton.layer.borderWidth = 1;
    okButton.layer.cornerRadius = 5;
    //    [self.view addSubview:okButton];
    
    
    
    
    
    
}

- (void) setupView{
    [self.view addSubview:self.bgImage];
    
    [self.view addSubview: self.nationField];
    [self addHorizontalLineView: CGRectMake(kMarginLeft,  self.nationField.frame.origin.y+self.nationField.frame.size.height+1,self.nationField.frame.size.width, 1)];
    
    [self.view addSubview:self.phoneField];
    [self addHorizontalLineView: CGRectMake(kMarginLeft,  self.phoneField.frame.origin.y+self.phoneField.frame.size.height+1,self.phoneField.frame.size.width, 1)];
    
    [self.view addSubview: self.passwordField];
    [self addHorizontalLineView: CGRectMake(kMarginLeft,  self.passwordField.frame.origin.y+self.passwordField.frame.size.height+1,self.passwordField.frame.size.width, 1)];
    [self.view addSubview:self.loginBtn];
    [self.view addSubview:self.registerBtn];
    [self.view addSubview:self.forgetPasswordbtn];
}

/**
 添加水平线
 */
- (void) addHorizontalLineView : (CGRect)frame{
    UIView *lineView = [[UIView alloc] initWithFrame: frame];
    [lineView setBackgroundColor: [UIColor colorWithRed: 64/255.0 green: 156/255.0 blue: 240/255.0 alpha:0.7f]];
    [self.view addSubview:lineView];
}


- (UIWindow*)currentWindow {
    return [UIApplication sharedApplication].keyWindow;
}
- (void) loginClick{
    NSString *phone = self.phoneField.text;
    NSString *password = self.passwordField.text;
    MainViewController *mainVc =  [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
//     UINavigationController *vc = [ [UINavigationController alloc] initWithRootViewController:[[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil]];
//    [self presentViewController:mainVc animated:YES completion:nil];
    [self currentWindow].rootViewController = mainVc;


//    if (phone.length>0&&password.length>0) {
//        if ([phone isEqualToString: @"123"]&&[password isEqualToString: @"123456"]) {
////            UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"密码正确，可以登录" preferredStyle: UIAlertControllerStyleAlert];
////            [alert addAction: [UIAlertAction actionWithTitle: @"好的" style: UIAlertActionStyleDefault handler: nil]];
////            [self presentViewController: alert animated:YES completion:nil];
//            MainViewController *rv =  [MainViewController new];
//            [self presentViewController:rv animated:YES completion:nil];
//        }else{
//            UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"密码不正确，请重新输入" preferredStyle: UIAlertControllerStyleAlert];
//            [alert addAction: [UIAlertAction actionWithTitle: @"好的" style: UIAlertActionStyleDefault handler: nil]];
//            [self presentViewController: alert animated:YES completion:nil];
//            
//        }
//        
//    }
    
}


- (void) goRegister{
    RegisterViewController *rv =  [RegisterViewController new];
    //将自己设置为代理
    rv.delegate = self;
    [self presentViewController:rv animated:YES completion:nil];}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//实现代理的方法
- (void)registerPhoneNumber:(NSString *)phoneNumberText password:(NSString *)password{
    self.phoneField.text = phoneNumberText;
    self.passwordField.text = password;
}

//懒加载
- (UIImageView *) bgImage{
    if (!_bgImage) {
        _bgImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
        _bgImage.image=[UIImage imageNamed:@"banner"];
        UIImageView *headerImage =[[UIImageView alloc] initWithImage:[ UIImage imageNamed: @"changzhengHospital"]];
        headerImage.frame = CGRectMake( 0, 0, 80, 80);
        headerImage.center = _bgImage.center;
        UIToolbar *tb = [[UIToolbar alloc]init];
        tb.frame = _bgImage.bounds;
        [_bgImage addSubview: tb];
        [_bgImage addSubview: headerImage];
    

    }
    return _bgImage;
}

- (UITextField *) nationField{
    if (_nationField==nil) {
        _nationField = [[UITextField alloc] initWithFrame: CGRectMake(kMarginLeft,_bgImage.frame.origin.y + _bgImage.frame.size.height+40, kTextFieldWidth, kTextFieldHeight)];
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

- (UITextField *) passwordField{
    if (!_passwordField) {
        _passwordField = [[UITextField alloc]initWithFrame: CGRectMake(kMarginLeft,_phoneField.frame.origin.y+_phoneField.frame.size.height+40,  kTextFieldWidth, kTextFieldHeight)];
        [_passwordField setPlaceholder:@"密码"];
        _passwordField.font = [UIFont systemFontOfSize: 16.0];
        //设置文本类
        _passwordField.autocorrectionType = UITextAutocapitalizationTypeWords;
        _passwordField.clearButtonMode = UITextFieldViewModeAlways;
        //设置是否是密码格式,并禁止复制
        _passwordField.secureTextEntry = YES;
        _passwordField.leftViewMode = UITextFieldViewModeAlways;
        //增加文字和图片直接的间距
        UIImageView *psLeftView=[[UIImageView alloc]initWithImage: [UIImage imageNamed: @"password"]];
        psLeftView.frame = CGRectMake(0.0, 0.0, psLeftView.image.size.width+15.0, psLeftView.image.size.height);
        psLeftView.contentMode = UIViewContentModeCenter;
        _passwordField.leftView = psLeftView;
    }
    return _passwordField;
}



- (UIButton *) loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType: UIButtonTypeSystem];
        _loginBtn.frame = CGRectMake( kMarginLeft,_passwordField.frame.origin.y +_passwordField.frame.size.height+40, kTextFieldWidth, kTextFieldHeight);
        [_loginBtn setTitle: @"登录" forState: UIControlStateNormal];
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:19];
        [_loginBtn setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
        _loginBtn.layer.cornerRadius = 5.f;
        _loginBtn.backgroundColor = [UIColor colorWithRed: 64/255.0 green: 156/255.0 blue: 240/255.0 alpha:1.0f];
        [_loginBtn addTarget: self action: @selector(loginClick) forControlEvents: UIControlEventTouchUpInside];
    }
    return  _loginBtn;
}

- (UIButton *) registerBtn{
    if ( !_registerBtn ) {
        _registerBtn = [UIButton buttonWithType: UIButtonTypeSystem];
        [_registerBtn setTitle:@"注册" forState: UIControlStateNormal];
        _registerBtn.frame = CGRectMake(kMarginLeft, _loginBtn.frame.origin.y + _loginBtn.frame.size.height+10,  40, 20);
        [_registerBtn addTarget: self action: @selector(goRegister) forControlEvents: UIControlEventTouchUpInside];
        
    }
    return _registerBtn;
}

- (UIButton *) forgetPasswordbtn{
    if ( !_forgetPasswordbtn ) {
        _forgetPasswordbtn = [UIButton buttonWithType: UIButtonTypeSystem];
        [_forgetPasswordbtn setTitle: @"忘记密码" forState: UIControlStateNormal];
        _forgetPasswordbtn.frame = CGRectMake(_loginBtn.frame.origin.x + _loginBtn.frame.size.width - 80 , _loginBtn.frame.origin.y + _loginBtn.frame.size.height+10,  80, 20);
        [_forgetPasswordbtn addTarget:self action: @selector(fotgetPassword) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _forgetPasswordbtn;
}

- (void) fotgetPassword{
    NSMutableArray<UIImage *> *gifImageArr = [NSMutableArray array];
    for (int i=0; i<24; i++) {
        NSString *imageName = [NSString stringWithFormat:@"ambulance%d",i+1];
        UIImage *image = [UIImage imageNamed:imageName];
        [gifImageArr addObject:image];
    }
    
    self.gifImage.animationImages = gifImageArr;
    self.gifImage.animationRepeatCount = 0;
    self.gifImage.animationDuration =0.5;
    [self.gifImage startAnimating];
}

- (IBAction)start:(UIButton *)sender {
    NSMutableArray<UIImage *> *gifImageArr = [NSMutableArray array];
    for (int i=0; i<24; i++) {
        NSString *imageName = [NSString stringWithFormat:@"ambulance%d",i+1];
        UIImage *image = [UIImage imageNamed:imageName];
        [gifImageArr addObject:image];
    }
    
    self.gifImage.animationImages = gifImageArr;
    self.gifImage.animationRepeatCount = 0;
    self.gifImage.animationDuration =0.5;
    [self.gifImage startAnimating];
}
- (IBAction)end:(UIButton *)sender {
    [self.gifImage stopAnimating];
}

@end
