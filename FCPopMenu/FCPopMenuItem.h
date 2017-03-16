//
//  FCPopMenuItem.h
//  FriendCircle
//
//  Created by xgf on 17/2/27.
//  Copyright © 2017年 xgf. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFCPopMenuDeprecated(msg) NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, msg)


@interface FCPopMenuItem : NSObject

typedef void(^FCPopMenuItemHandler)(FCPopMenuItem *sender);

@property(nonatomic,strong)UIImage              *image;
@property(nonatomic,copy)NSString               *title;
@property(nonatomic,weak)id                     target;
@property(nonatomic)SEL                         action;
@property(nonatomic,strong)UIColor              *titleColor;
@property(nonatomic,strong)UIColor              *selectedColor;//default nil
@property(nonatomic,copy)FCPopMenuItemHandler   handler;
//v1.0 、 v1.1
+(instancetype)itemWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)color target:(id)target action:(SEL)action;
-(instancetype)initWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)color target:(id)target action:(SEL)action;

//v2.0
+(instancetype)itemWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)color handler:(FCPopMenuItemHandler)handler;
-(instancetype)initWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)color handler:(FCPopMenuItemHandler)handler;

@end
