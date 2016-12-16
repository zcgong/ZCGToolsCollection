//
//  SHPDFViewController.m
//  Quartz 2D 简单使用
//
//  Created by JiKer on 16/5/19.
//  Copyright © 2016年 JiKer. All rights reserved.
//

#import "SHPDFViewController.h"

@interface SHPDFViewController ()
{
    UILabel *_pageLbl;
}
@end

@implementation SHPDFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpProperty];
    [self addUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - System Methods -
-(BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark - Private Methods -

#pragma mark -初始化
-(void)setUpProperty{
    self.view.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    [self setNavigationBar];
}

-(void)setNavigationBar{
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:220/255.0 green:0 blue:39/255.0 alpha:1];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    
    self.title = @"读取/生成PDF";
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 20, 20);
    [leftBtn setImage:[UIImage imageNamed:@"leftArrow.png"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(backToUp) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftBar;
}


#pragma mark -界面

-(void)addUI{
    [self addTextView];
}

-(void)addTextView{
    
    SHPDFView *PDFView = [[SHPDFView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-184)];
    PDFView.pageNum = 1;
    PDFView.changePageBlock = ^(NSInteger pageCount,NSInteger pageNum){
        _pageLbl.text = [NSString stringWithFormat:@"%ld/%ld",pageNum,pageCount];
    };
    PDFView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:PDFView];
    
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftPan:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [PDFView addGestureRecognizer:leftSwipe];
    
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(rightPan:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [PDFView addGestureRecognizer:rightSwipe];
    
    _pageLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(PDFView.frame), kScreenWidth, 30)];
    _pageLbl.backgroundColor = [UIColor clearColor];
    _pageLbl.font = [UIFont systemFontOfSize:14];
    _pageLbl.textColor = [UIColor blackColor];
    _pageLbl.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_pageLbl];
}

#pragma  mark -方法
-(void)backToUp{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)leftPan:(UISwipeGestureRecognizer *)swipe{
    SHPDFView *PDFView = (SHPDFView *)swipe.view;
    if (PDFView.pageCount <= PDFView.pageNum) {
        NSLog(@"这已经是最后一页了");
        return;
    }
}

-(void)rightPan:(UISwipeGestureRecognizer *)swipe{
    SHPDFView *PDFView = (SHPDFView *)swipe.view;
    if (PDFView.pageNum <= 0) {
        NSLog(@"这已经是首页了");
        return;
    }
    PDFView.pageNum --;
    
}

#pragma mark - Delegate -

#pragma mark -UIPageViewControllerDataSource
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    return self;
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    return self;
}
#pragma mark -UIPageViewControllerDelegate
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
