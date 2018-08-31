//
//  CCCollectionViewCell.m
//  CCCollectionStretchAnim
//
//  Created by cocoa on 2018/8/30.
//  Copyright © 2018年 cocoa. All rights reserved.
//

#import "CCCollectionViewCell.h"
#import <Masonry.h>

@interface CCCollectionViewCell()
@property(nonatomic, strong) UIImageView *goodsImage;
@property(nonatomic, strong) UILabel *goodsName;
@end

@implementation CCCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _goodsImage = [[UIImageView alloc] init];
        [self addSubview:_goodsImage];
        [_goodsImage setImage:[UIImage imageNamed:@"example"]];
        
        _goodsName = [[UILabel alloc] init];
        [_goodsName setFont:[UIFont boldSystemFontOfSize:12]];
        [_goodsName setTextColor:[UIColor grayColor]];
        [self addSubview:_goodsName];
        _goodsName.text = @"标题标题";
        
        [_goodsImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(self);
            make.right.equalTo(self).offset(-5);
            make.height.equalTo(@100);
            make.width.equalTo(@110);
        }];
        
        [_goodsName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.goodsImage.mas_bottom).offset(5);
            make.left.equalTo(self.goodsImage).offset(5);
            make.right.equalTo(self.goodsImage).offset(-5);
        }];
        
        self.layer.borderColor = [UIColor redColor].CGColor;
        self.layer.borderWidth = 0.5;
    }
    return self;
}

@end
