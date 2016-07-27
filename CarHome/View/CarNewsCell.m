//
//  CarNewsCell.m
//  CarHome
//
//  Created by tarena on 16/6/12.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "CarNewsCell.h"

@implementation CarNewsCell
- (UILabel *)timeLb {
    if(_timeLb == nil) {
        _timeLb = [[UILabel alloc] init];
        [self.contentView addSubview:_timeLb];
        _timeLb.font = [UIFont systemFontOfSize:14];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLb);
            make.bottom.equalTo(self.iconIV);
        }];
        _timeLb.textColor = [UIColor darkGrayColor];
    }
    return _timeLb;
}

- (UILabel *)replyCountLb {
    if(_replyCountLb == nil) {
        _replyCountLb = [[UILabel alloc] init];
        [self.contentView addSubview:_replyCountLb];
        _replyCountLb.font = [UIFont systemFontOfSize:14];
        [_replyCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.titleLb);
            make.bottom.equalTo(self.timeLb);
        }];
        _replyCountLb.textColor = [UIColor darkGrayColor];
    }
    return _replyCountLb;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        _titleLb.numberOfLines = 0;
        _titleLb.font = [UIFont systemFontOfSize:16];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconIV);
            make.left.equalTo(self.iconIV.mas_right).equalTo(5);
            make.right.equalTo(-5);
            //小于等于2行的高度, 这个高度是猜的
            make.height.lessThanOrEqualTo(45);
        }];
    }
    return _titleLb;
}

- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(80, 60));
            make.centerY.equalTo(0);
            make.left.equalTo(10);
        }];
        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
        _iconIV.clipsToBounds = YES;
        _iconIV.layer.cornerRadius = 4;
    }
    return _iconIV;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self replyCountLb];
        
        self.separatorInset = UIEdgeInsetsZero;
        self.layoutMargins = UIEdgeInsetsZero;
        self.preservesSuperviewLayoutMargins = NO;
    }
    return self;
}

@end
