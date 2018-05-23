//
//  RegisterViewController.h
//  HelloWorld
//
//  Created by strive cheng on 2018/5/4.
//  Copyright © 2018年 rbl. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol RegisterViewControllerDelegete <NSObject>

- (void) registerPhoneNumber:(NSString *)phoneNumberText password:(NSString *)password;

@end

@interface RegisterViewController : UIViewController

@property (nonatomic,weak) id<RegisterViewControllerDelegete> delegate;

@end
