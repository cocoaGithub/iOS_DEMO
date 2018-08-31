//
//  CCStretchAnimView.m
//  CCCollectionStretchAnim
//
//  Created by cocoa on 2018/8/30.
//  Copyright © 2018年 cocoa. All rights reserved.
//

#import "CCStretchAnimView.h"
#import <Masonry.h>

#define FOOTER_VIEW_WIDTH 60
#define FOOTER_VIEW_HEIGHT 146

@interface CCStretchAnimView()
@property(nonatomic, assign) CGFloat sizeWidth;
@property(nonatomic, strong) UILabel *tipsLab;
@property(nonatomic, strong) CAShapeLayer *shape;
@end

@implementation CCStretchAnimView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        _shape = [[CAShapeLayer alloc] init];
        _shape.frame = CGRectMake(0, 0, 1, FOOTER_VIEW_HEIGHT);
        [self.layer addSublayer:_shape];
        _shape.fillColor = [UIColor grayColor].CGColor;
        _shape.strokeColor = [UIColor grayColor].CGColor;
        
        _tipsLab = [[UILabel alloc] init];
        _tipsLab.textAlignment = NSTextAlignmentCenter;
        _tipsLab.font = [UIFont systemFontOfSize:14];
        _tipsLab.textColor = [UIColor redColor];
        _tipsLab.text = @"查\n看\n更\n多";
        _tipsLab.numberOfLines = 0;
        [self addSubview:_tipsLab];
        
        [_tipsLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self).offset(20);
        }];
    }
    return self;
}

-(void)contentWidth:(CGFloat)width{
    self.sizeWidth = width - cScreenWidth;
    self.frame = CGRectMake(width,0, FOOTER_VIEW_WIDTH * 3 , FOOTER_VIEW_HEIGHT);
}

- (void)scrollViewContentOffsetChanged:(CGPoint)contentOffset {
    CGFloat x = contentOffset.x - self.sizeWidth;
    if (x > CC_Stretch_Rigth_Offset) {
        [UIView animateWithDuration:0.5 animations:^{
            
        } completion:^(BOOL finished) {
            self.tipsLab.text = @"释\n放\n查\n看";
        }];
        
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            
        } completion:^(BOOL finished) {
            self.tipsLab.text = @"查\n看\n更\n多";
        }];
    }
    
    if (x > 0) {
        UIBezierPath *path = [[UIBezierPath alloc] init];
        [path moveToPoint:CGPointMake(x , 0)];
        [path addQuadCurveToPoint:CGPointMake(x,FOOTER_VIEW_HEIGHT) controlPoint:CGPointMake(-x, FOOTER_VIEW_HEIGHT/2.0)];
        [_shape setPath:path.CGPath];
        NSLog(@"shape:%@", NSStringFromCGPoint(CGPointMake(0, FOOTER_VIEW_HEIGHT/2.0)));
    }

}

@end
