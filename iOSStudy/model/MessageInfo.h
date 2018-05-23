//
//  MessageInfo.h
//  HelloWorld
//
//  Created by strive cheng on 2018/5/22.
//  Copyright © 2018年 rbl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageInfo : NSObject

/** 标题 */
@property (nonatomic,copy) NSString *title;
/** 最新信息 */
@property (nonatomic,copy) NSString *lastMessage;
/** <##>时间 */
@property (nonatomic,copy) NSString *time;

@end
