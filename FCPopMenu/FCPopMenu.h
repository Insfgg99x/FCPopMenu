//
//  FCPopMenu.h
//  FriendCircle
//
//  Created by xgf on 17/2/27.
//  Copyright © 2017年 xgf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCPopMenuItem.h"

@interface FCPopMenu : UIView

@property(nonatomic,strong)UIColor          *sperateColor;  //default lightGrayColor
@property(nonatomic,assign)UIEdgeInsets     seperateInsets; //default UIEdgeInsetsZero
@property(nonatomic,assign)CGFloat          rowHeight;      //default 40
@property(nonatomic,strong)UIColor          *mainColor;     //default 0x494949
@property(nonatomic,assign)NSTextAlignment  textAliment;    //default left

+(instancetype)menuWithFrame:(CGRect)frame
               trangleHeight:(CGFloat)trangleHeight
             tranglePosition:(CGPoint)tranglePosition
                       items:(NSArray<FCPopMenuItem *> *)items;

-(instancetype)initWithFrame:(CGRect)frame
               trangleHeight:(CGFloat)trangleHeight
             tranglePosition:(CGPoint)tranglePosition
                       items:(NSArray<FCPopMenuItem *> *)items;

@end
