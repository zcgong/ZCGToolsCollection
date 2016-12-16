//
//  ViewController.m
//  XJDropDownMeun
//
//  Created by 徐晶 on 16/3/4.
//  Copyright © 2016年 徐晶. All rights reserved.
//

#import "ViewController.h"
#import "XJDopdownView.h"

@interface ViewController ()<XJDopdownViewDelegate>
{
    NSMutableArray *array;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XJDopdownView *xjDropView = [[XJDopdownView alloc]initWithFrame:CGRectMake(100, 100, 100, 160) andButtonheight:40];
    [self.view addSubview:xjDropView];
    xjDropView.layer.borderWidth=1;
    xjDropView.layer.cornerRadius=5;
    array = [[NSMutableArray alloc]initWithObjects:@"选项一",@"选项二",@"选项三",@"选项四",@"选项五",@"选项六", nil];
    xjDropView.dataArray = array;
    xjDropView.delegate=self;
    
}


-(void)selectIndex:(NSInteger)index
{
    NSLog(@"==========%@========%ld",array[index],index);
}


@end
