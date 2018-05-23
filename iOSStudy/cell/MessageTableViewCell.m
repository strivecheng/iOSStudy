//
//  TableViewCell.m
//  HelloWorld
//
//  Created by strive cheng on 2018/5/15.
//  Copyright © 2018年 rbl. All rights reserved.
//

#import "MessageTableViewCell.h"


@interface MessageTableViewCell()


/** 标题view */
@property (nonatomic,strong) UILabel *titleLabel;
/** 最后消息view */
@property (nonatomic,strong) UILabel *lastMessageLabel;
/** 时间 */
@property (nonatomic,strong) UILabel *timeLabel;
/** 头像 */
@property (nonatomic,strong) UIImageView *headImageView;

@end

@implementation MessageTableViewCell

- (void)setMessage:(MessageInfo *)message{
    _message = message;
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.lastMessageLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.headImageView];

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark 懒加载

- (UIImageView *)headImageView{
    if (!_headImageView) {
        self.headImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jay"]];
        self.headImageView.frame = CGRectMake(5, 5, 45, 45);
        self.headImageView.layer.cornerRadius = 5;
    }
    return _headImageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc]init];
        self.titleLabel.frame = CGRectMake(self.headImageView.frame.size.width+self.headImageView.frame.origin.x+5, 5,300,20);
        self.titleLabel.text = self.message.title;
    }
    return _titleLabel;
}

- (UILabel *)lastMessageLabel{
    if (!_lastMessageLabel) {
        self.lastMessageLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.headImageView.frame.size.width+self.headImageView.frame.origin.x+5, self.titleLabel.frame.size.height+self.titleLabel.frame.origin.y+5,300,20)];
        self.lastMessageLabel.text = self.message.lastMessage;
        self.lastMessageLabel.font = [UIFont systemFontOfSize:12];
        self.lastMessageLabel.textColor = [UIColor grayColor];
    }
    return _lastMessageLabel;
}

- (UILabel *)timeLabel{
    if (!_timeLabel) {
        self.timeLabel = [[UILabel alloc]init];
        self.timeLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-30-10, 5,50,20);
        self.timeLabel.text = self.message.time;
        self.timeLabel.font = [UIFont systemFontOfSize:12];
        self.timeLabel.textColor = [UIColor grayColor];
    }
    return _timeLabel;
}




@end
