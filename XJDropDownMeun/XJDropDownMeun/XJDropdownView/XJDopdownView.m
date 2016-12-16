//
//  XJDopdownView.m
//  XJDropDownMeun
//
//  Created by 徐晶 on 16/3/4.
//  Copyright © 2016年 徐晶. All rights reserved.
//

#import "XJDopdownView.h"
#import "UIView+WHC_AutoLayout.h"
#import "Masonry.h"
#define selfWidth  self.frame.size.width
#define selfHeight self.frame.size.height

@interface XJDopdownView ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UIView *customView;
@property(nonatomic,strong)UILabel *titleLable;
@property(nonatomic,strong)UIImageView *rightImageView;
@property(nonatomic,assign)BOOL isSelect;
@property(nonatomic,strong)UITableView *customTableView;
@property(nonatomic,strong)UIButton *customButton;
@property(nonatomic,assign)CGFloat viewHegit;
@property(nonatomic,assign)CGFloat tableViewHegit;
@property(nonatomic,assign)CGFloat selfX;
@property(nonatomic,assign)CGFloat selfY;
@property(nonatomic,assign)CGFloat selfandWidth;

@end
@implementation XJDopdownView

-(instancetype)initWithFrame:(CGRect)frame andButtonheight:(CGFloat)height
{
    self.viewHegit = height;
    self.tableViewHegit =frame.size.height;
    self.selfX = frame.origin.x;
    self.selfY = frame.origin.y;
    self.selfandWidth = frame.size.width;
    
    self = [super initWithFrame:frame];
    if(self)
    {
        
        
        self.titleLable = [[UILabel alloc]init];
        [self addSubview:self.titleLable];
        self.titleLable.font=[UIFont systemFontOfSize:14];
        self.titleLable.textAlignment=NSTextAlignmentCenter;
        self.titleLable.text=@"请选择";
        [self.titleLable whc_LeftSpace:0];
        [self.titleLable whc_RightSpace:0];
        [self.titleLable whc_TopSpace:0];
        [self.titleLable whc_Height:self.viewHegit];
        [self.titleLable whc_WidthAuto];
        [self.titleLable whc_CenterX:-7.5];

        self.rightImageView = [[UIImageView alloc]init];
        [self addSubview:self.rightImageView];
        self.rightImageView.image = [UIImage imageNamed:@"down_dark0"];
        [self.rightImageView whc_LeftSpace:0 relativeView:self.titleLable];
        [self.rightImageView whc_CenterY:0 relativeView:self.titleLable];
        [self.rightImageView whc_Width:15];
        [self.rightImageView whc_Height:15];
        
        
        self.isSelect = NO;
        
        self.customTableView = [[UITableView alloc]init];
        [self addSubview:self.customTableView];
        [self.customTableView whc_LeftSpace:0];
        [self.customTableView whc_RightSpace:0];
        [self.customTableView whc_TopSpace:0 relativeView:self.titleLable];
        [self.customTableView whc_Height:0];
        self.customTableView.delegate=self;
        self.customTableView.dataSource=self;

        self.customButton = [[UIButton alloc]init];
        [self addSubview:self.customButton];
        [self.customButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(0);
            make.right.equalTo(self).offset(0);
            make.top.equalTo(self).offset(0);
            make.height.equalTo(@(self.viewHegit));
        }];
        [self.customButton addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
        
        if(self.isSelect==NO)
        {
            self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, height);
        }
        

    }
    return self;
}



-(void)btnclick
{
    self.isSelect = !self.isSelect;
    [UIView animateWithDuration:1.0 animations:^{
        if(self.isSelect==NO)
        {
            self.rightImageView.image = [UIImage imageNamed:@"down_dark0"];
            
            self.frame = CGRectMake(self.selfX, self.selfY, self.selfandWidth, self.viewHegit);
            [self.customTableView whc_Height:0];
            [self.customTableView layoutIfNeeded];
        }else{
            
            self.rightImageView.image = [UIImage imageNamed:@"down_dark1"];
            
            self.frame = CGRectMake(self.selfX, self.selfY, self.selfandWidth, self.viewHegit+self.tableViewHegit);
            [self.customTableView whc_Height:self.tableViewHegit];
            [self.customTableView layoutIfNeeded];
        }
        

    }];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.titleLable.text=self.dataArray[indexPath.row];
    self.rightImageView.image = [UIImage imageNamed:@"down_dark0"];
    self.frame = CGRectMake(self.selfX, self.selfY, self.selfandWidth, self.viewHegit);
    [self.customTableView whc_Height:0];
    [self.customTableView layoutIfNeeded];
    self.isSelect=NO;
    
    [self.delegate selectIndex:indexPath.row];
}

@end
