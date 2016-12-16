//
//  SHImageViewController.m
//  Quartz 2D 简单使用
//
//  Created by JiKer on 16/5/19.
//  Copyright © 2016年 JiKer. All rights reserved.
//

#import "SHImageViewController.h"

@interface SHImageViewController ()

@end

@implementation SHImageViewController

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
    
    self.title = @"读取/生成图片(图像)";
    
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
    SHImageDrawView *drawView = [[SHImageDrawView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64)];
    drawView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:drawView];
    
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint
                                         constraintWithItem:drawView
                                         attribute:NSLayoutAttributeTop
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:self.view
                                         attribute:NSLayoutAttributeTop
                                         multiplier:1
                                         constant:0];
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint
                                          constraintWithItem:drawView
                                          attribute:NSLayoutAttributeLeft
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self.view
                                          attribute:NSLayoutAttributeLeft
                                          multiplier:1
                                          constant:0];
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint
                                            constraintWithItem:drawView
                                            attribute:NSLayoutAttributeBottom
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.view
                                            attribute:NSLayoutAttributeBottom
                                            multiplier:1
                                            constant:0];
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint
                                           constraintWithItem:drawView
                                           attribute:NSLayoutAttributeRight
                                           relatedBy:NSLayoutRelationEqual
                                           toItem:self.view
                                           attribute:NSLayoutAttributeRight
                                           multiplier:1
                                           constant:0];
    [NSLayoutConstraint activateConstraints:@[topConstraint,leftConstraint,bottomConstraint,rightConstraint]];
}

#pragma  mark -方法
-(void)backToUp{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
