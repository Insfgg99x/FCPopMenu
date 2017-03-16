//
//  FCPopMenuItem.m
//  FriendCircle
//
//  Created by xgf on 17/2/27.
//  Copyright © 2017年 xgf. All rights reserved.
//

#import "FCPopMenuItem.h"

@interface FCPopMenuItem()


@end

@implementation FCPopMenuItem

//v1.0 、v1.1
+(instancetype)itemWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)color target:(id)target action:(SEL)action{
    
    return [[[self class] alloc] initWithImage:image title:title titleColor:color target:target action:action];
}
-(instancetype)initWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)color target:(id)target action:(SEL)action{
    
    if(self=[super init]){
        
        _image=image;
        _title=title;
        _target=target;
        _action=action;
        _titleColor=color;
        _selectedColor=nil;
    }
    return self;
}

//v2.0
+(instancetype)itemWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)color handler:(FCPopMenuItemHandler)handler{
    
    return [[[self class] alloc] initWithImage:image title:title titleColor:color handler:handler];
}
-(instancetype)initWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)color handler:(FCPopMenuItemHandler)handler{
    
    if(self=[super init]){
        
        _image=image;
        _title=title;
        _titleColor=color;
        _selectedColor=nil;
        _handler=[handler copy];
    }
    return self;
}

@end
