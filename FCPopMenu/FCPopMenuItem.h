//
//  FCPopMenuItem.h
//  FriendCircle
//
//  Created by xgf on 17/2/27.
//  Copyright © 2017年 xgf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FCPopMenuItem : NSObject

@property(nonatomic,strong)UIImage      *image;
@property(nonatomic,copy)NSString       *title;
@property(nonatomic,weak)id             target;
@property(nonatomic)SEL                 action;
@property(nonatomic,strong)UIColor      *titleColor;
@property(nonatomic,strong)UIColor      *selectedColor;//default nil

+(instancetype)itemWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)color target:(id)target action:(SEL)action;
-(instancetype)initWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)color target:(id)target action:(SEL)action;

@end
