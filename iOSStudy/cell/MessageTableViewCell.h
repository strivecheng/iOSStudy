//
//  TableViewCell.h
//  HelloWorld
//
//  Created by strive cheng on 2018/5/15.
//  Copyright © 2018年 rbl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageInfo.h"

@interface MessageTableViewCell : UITableViewCell

/** 消息 */
@property (nonatomic,strong) MessageInfo *message;

@end
