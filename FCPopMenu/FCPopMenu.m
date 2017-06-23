//
//  FCPopMenu.m
//  FriendCircle
//
//  Created by xgf on 17/2/27.
//  Copyright © 2017年 xgf. All rights reserved.
//

#import "FCPopMenu.h"

//arrow direction
typedef enum : NSUInteger {
    
    FCPopMenuArrwoDirectionLeft,
    FCPopMenuArrwoDirectionRight,
    FCPopMenuArrwoDirectionUp,
    FCPopMenuArrwoDirectionDown
    
} FCPopMenuArrwoDirection;
@interface FCPopMenu()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,assign)CGFloat          trangleHeight;
@property(nonatomic,assign)CGPoint          tranglePosition;
@property(nonatomic,strong)NSArray          *items;
@property(nonatomic,strong)UITableView      *tbView;

@end

@implementation FCPopMenu

+(instancetype)menuWithFrame:(CGRect)frame trangleHeight:(CGFloat)trangleHeight tranglePosition:(CGPoint)tranglePosition items:(NSArray<FCPopMenuItem *> *)items{
    
    return [[FCPopMenu alloc] initWithFrame:frame
                              trangleHeight:trangleHeight
                            tranglePosition:tranglePosition
                                      items:items];
}
-(instancetype)initWithFrame:(CGRect)frame trangleHeight:(CGFloat)trangleHeight tranglePosition:(CGPoint)tranglePosition items:(NSArray<FCPopMenuItem *> *)items{

    if(self=[super initWithFrame:frame]){
        
        _rowHeight=40;
        _trangleHeight=trangleHeight;
        _tranglePosition=tranglePosition;
        _items=items;
        _mainColor=[UIColor colorWithRed:73/255.f green:73/255.f blue:73/255.f alpha:1.f];
        _seperateInsets=UIEdgeInsetsZero;
        _sperateColor=[UIColor lightGrayColor];
        _textAliment=NSTextAlignmentLeft;
        self.backgroundColor=[UIColor clearColor];
        [self setNeedsDisplay];
        [self createUI];
    }
    return self;
}
-(void)createUI{
    
    FCPopMenuArrwoDirection direction=[self arrowDirection];
    CGRect rect=CGRectZero;
    if(direction==FCPopMenuArrwoDirectionUp){
        
        rect=CGRectMake(0, _trangleHeight, self.frame.size.width, self.frame.size.height-_trangleHeight);
        
    }else if(direction==FCPopMenuArrwoDirectionDown){

        rect=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-_trangleHeight);
        
    }else if(direction==FCPopMenuArrwoDirectionLeft){
        
        rect=CGRectMake(_trangleHeight, 0, self.frame.size.width-_trangleHeight, self.frame.size.height);
        
    }else{
        
        rect=CGRectMake(0, 0, self.frame.size.width-_trangleHeight, self.frame.size.height);
    }
    _tbView=[[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
    [self addSubview:_tbView];
    _tbView.delegate=self;
    _tbView.dataSource=self;
    _tbView.separatorInset=self.seperateInsets;
    _tbView.separatorColor=self.sperateColor;
    _tbView.layer.cornerRadius=2;
    _tbView.backgroundColor=_mainColor;
    UIView *footer=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.01)];
    _tbView.tableFooterView=footer;
}
-(FCPopMenuArrwoDirection)arrowDirection{
    
    if(_tranglePosition.x==self.frame.origin.x){
        
        return FCPopMenuArrwoDirectionLeft;
        
    }else if(_tranglePosition.x==self.frame.origin.x+self.bounds.size.width){
        
        return FCPopMenuArrwoDirectionRight;
        
    }else if(_tranglePosition.y==self.frame.origin.y){
        
        return FCPopMenuArrwoDirectionUp;
        
    }else if(_tranglePosition.y==self.frame.origin.y+self.bounds.size.height){
        
        return FCPopMenuArrwoDirectionDown;
    }
    return FCPopMenuArrwoDirectionUp;
}

-(void)drawRect:(CGRect)rect{
    
    FCPopMenuArrwoDirection direction=[self arrowDirection];
    UIBezierPath *path=[UIBezierPath bezierPath];
    [_mainColor setFill];
    
    CGPoint p1;
    CGPoint p2;
    CGPoint p3;
    CGFloat length=(_trangleHeight*1.414);
    switch (direction) {
        case FCPopMenuArrwoDirectionUp:
            
            p1=CGPointMake(_tranglePosition.x, _trangleHeight);
            p2=CGPointMake(_tranglePosition.x+length/2, 0);
            p3=CGPointMake(_tranglePosition.x+length, _trangleHeight);
            break;
        case FCPopMenuArrwoDirectionDown:
            
            p1=CGPointMake(_tranglePosition.x, self.bounds.size.height-_trangleHeight);
            p2=CGPointMake(_tranglePosition.x+length/2, self.bounds.size.height);
            p3=CGPointMake(_tranglePosition.x+length, self.bounds.size.height-_trangleHeight);
            break;
        case FCPopMenuArrwoDirectionLeft:
            
            p1=CGPointMake(_trangleHeight, _tranglePosition.y);
            p2=CGPointMake(0, _tranglePosition.y+length/2);
            p3=CGPointMake(_trangleHeight, _tranglePosition.y+length);
            break;
        case FCPopMenuArrwoDirectionRight:
            
            p1=CGPointMake(self.bounds.size.width-_trangleHeight, _tranglePosition.y);
            p2=CGPointMake(self.bounds.size.width, _tranglePosition.y+length/2);
            p3=CGPointMake(self.bounds.size.width-_trangleHeight, _tranglePosition.y+length);
            break;
            
        default:
            break;
    }
    [path moveToPoint:p1];
    [path addLineToPoint:p2];
    [path addLineToPoint:p3];
    [path fill];
    [path closePath];
}
#pragma mark - UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _items.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *fc_popmenu_cell_id=@"fc_popmenu_cell_id";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:fc_popmenu_cell_id];
    if(!cell){
        
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:fc_popmenu_cell_id];
        cell.selectionStyle=UITableViewCellEditingStyleNone;
    }
    cell.backgroundColor=_mainColor;
    cell.separatorInset=_seperateInsets;
    FCPopMenuItem *item=[_items objectAtIndex:indexPath.row];
    cell.textLabel.text=[item.title copy];
    cell.textLabel.font=[UIFont systemFontOfSize:15];
    cell.textLabel.textColor=item.titleColor;
    cell.textLabel.textAlignment=_textAliment;
    if(item.selectedColor){
        
        cell.textLabel.textColor=item.selectedColor;
    }
    cell.imageView.image=item.image;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //v2.0
    FCPopMenuItem *item=[_items objectAtIndex:indexPath.row];
    if(item.handler){
        
        item.handler(item);
    }
    //v1.0
    [item.target performSelectorOnMainThread:item.action withObject:item waitUntilDone:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return _rowHeight;
}
#pragma mark - setter
-(void)setMainColor:(UIColor *)mainColor{
    
    _mainColor=mainColor;
    [self setNeedsDisplay];
    _tbView.backgroundColor=mainColor;
    [_tbView reloadData];
}
-(void)setRowHeight:(CGFloat)rowHeight{
    
    _rowHeight=rowHeight;
    [_tbView reloadData];
}
-(void)setSeperateInsets:(UIEdgeInsets)seperateInsets{
    
    _seperateInsets=seperateInsets;
    [_tbView reloadData];
}
-(void)setSperateColor:(UIColor *)sperateColor{
    
    _sperateColor=sperateColor;
    [_tbView reloadData];
}
-(void)setTextAliment:(NSTextAlignment)textAliment{
    
    _textAliment=textAliment;
    [_tbView reloadData];
}

@end
