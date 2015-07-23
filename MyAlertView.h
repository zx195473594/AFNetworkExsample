//
//  MyAlertView.h
//  AFNetworkExsample
//
//  Created by ibokan on 15/7/21.
//  Copyright (c) 2015年 spoil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyAlertView : UIView
- (id)initWithTitle:(NSString *)title
        contentText:(NSString *)content
    leftButtonTitle:(NSString *)leftTitle
   rightButtonTitle:(NSString *)rigthTitle
     middleBtnTitle:(NSString *)midTitle;

- (id)initWithTitle:(NSString *)title
        contentText:(NSString *)content
    leftButtonTitle:(NSString *)leftTitle
   rightButtonTitle:(NSString *)rigthTitle;

- (void)show;

@property (nonatomic, copy) dispatch_block_t leftBlock;
@property (nonatomic, copy) dispatch_block_t rightBlock;
@property (nonatomic, copy) dispatch_block_t dismissBlock;

@end

@interface UIImage (colorful)

+ (UIImage *)imageWithColor:(UIColor *)color;

@end