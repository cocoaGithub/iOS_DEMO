//
//  CCStretchAnimView.h
//  CCCollectionStretchAnim
//
//  Created by cocoa on 2018/8/30.
//  Copyright © 2018年 cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

#define cScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define CC_Stretch_Rigth_Offset 40

@interface CCStretchAnimView : UIView
-(void)contentWidth:(CGFloat)width;
- (void)scrollViewContentOffsetChanged:(CGPoint)contentOffset;
@end
