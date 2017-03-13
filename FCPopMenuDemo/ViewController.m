//
//  ViewController.m
//  FCPopMenuDemo
//
//  Created by xgf on 17/3/13.
//  Copyright © 2017年 abc. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "FCPopMenu.h"


#define kFCPopMenuWidth    ([UIScreen mainScreen].bounds.size.width)
#define kFCPopMenuHeight   ([UIScreen mainScreen].bounds.size.height)


@interface ViewController ()

@property(nonatomic,strong)FCPopMenu *list;
@property(nonatomic,strong)UIControl *back;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setup];
    [self createUI];
}
-(void)setup{
    
    self.navigationController.navigationBar.barStyle=UIBarStyleBlack;
    self.title=@"FCPopMenuDemo";
    self.view.backgroundColor=[UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets=NO;
}
-(void)createUI{
    
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addBtnClickAction:)];
    rightItem.tintColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem=rightItem;
}
-(void)addBtnClickAction:(UIBarButtonItem *)sender{
    
    sender.enabled=NO;
    if(self.list.superview){
        
        [self hideList:self.back];
        sender.enabled=YES;
        return;
    }
    [self.view addSubview:self.back];
    [self.view addSubview:self.list];
    self.list.alpha=0.0;
    __weak typeof(self) wkself=self;
    [self.list mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(wkself.view).offset(-5);
        make.top.equalTo(wkself.view).offset(64);
        make.size.mas_equalTo(CGSizeMake(138, 140));
    }];
    [UIView animateWithDuration:0.3 animations:^{
        
        wkself.list.alpha=1.0;
    }];
    sender.enabled=YES;
}
-(FCPopMenu *)list{
    
    if(!_list){
        
        NSArray *items=@[[FCPopMenuItem itemWithImage:[UIImage imageNamed:@"sence_new"]
                                                title:@"新建剧情"
                                           titleColor:[UIColor whiteColor]
                                               target:self
                                               action:@selector(listClickAction:)],
                         [FCPopMenuItem itemWithImage:[UIImage imageNamed:@"recruit_new"]
                                                title:@"发布招募"
                                           titleColor:[UIColor whiteColor]
                                               target:self
                                               action:@selector(listClickAction:)],
                         [FCPopMenuItem itemWithImage:[UIImage imageNamed:@"sence_search"]
                                                title:@"搜一搜"
                                           titleColor:[UIColor whiteColor]
                                               target:self
                                               action:@selector(listClickAction:)]];
        _list=[FCPopMenu menuWithFrame:CGRectMake(kFCPopMenuWidth-143, 64, 138, 140) trangleHeight:10 tranglePosition:CGPointMake(112, 0) items:items];
        _list.mainColor=[UIColor colorWithRed:73/255.f green:73/255.f blue:73/255.f alpha:1.f];
        _list.rowHeight=43.5;
        _list.sperateColor=[UIColor colorWithRed:217/255.f green:217/255.f blue:217/255.f alpha:1.f];
        _list.seperateInsets=UIEdgeInsetsMake(0, 14, 0, 14);
    }
    return _list;
}
-(UIControl *)back{
    
    if(!_back){
        
        _back=[[UIControl alloc] initWithFrame:self.view.bounds];
        _back.backgroundColor=[UIColor clearColor];
        [_back addTarget:self action:@selector(hideList:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _back;
}
-(void)listClickAction:(FCPopMenuItem *)sender{
    
    [self hideList:self.back];
    NSString *title=[sender.title copy];
    if([title isEqualToString:@"新建剧情"]){
        

        
    }else if([title isEqualToString:@"发布招募"]){
        

        
    }else{
        

    }
    NSLog(@"%@",sender.title);
}

-(void)hideList:(UIControl *)sender{
    
    [sender removeFromSuperview];
    [self.list removeFromSuperview];
}

@end
