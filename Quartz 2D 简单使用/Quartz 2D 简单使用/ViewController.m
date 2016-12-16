//
//  ViewController.m
//  Quartz 2D 简单使用
//
//  Created by JiKer on 16/5/18.
//  Copyright © 2016年 JiKer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UITableView *_tableView;
    NSArray *_dataArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpProperty];
    [self getData];
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
}

#pragma mark -数据
-(void)getData{
    _dataArray = @[@"绘制图形",
                   @"绘制文字",
                   @"读取/生成图片(图像)",
                   @"读取/生成PDF",
                   @"截图/裁剪图片",
                   @"自定义UI控件"];
    [self addUI];
}

#pragma mark -界面

-(void)addUI{
    _tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    UILabel *headerLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(_tableView.frame), 44)];
    headerLbl.backgroundColor = [UIColor whiteColor];
    headerLbl.font = [UIFont systemFontOfSize:14];
    headerLbl.text = @"Quartz 2D 功能";
    headerLbl.textColor = [UIColor blackColor];
    headerLbl.textAlignment = NSTextAlignmentCenter;
    _tableView.tableHeaderView = headerLbl;
    _tableView.tableFooterView = [[UIView alloc]init];
    
    NSLayoutConstraint *TopConstraint = [NSLayoutConstraint
                                         constraintWithItem:_tableView
                                         attribute:NSLayoutAttributeTop
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:self.view
                                         attribute:NSLayoutAttributeTop
                                         multiplier:1
                                         constant:0];
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint
                                          constraintWithItem:_tableView
                                          attribute:NSLayoutAttributeLeft
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self.view
                                          attribute:NSLayoutAttributeLeft
                                          multiplier:1
                                          constant:0];
    NSLayoutConstraint *BottomConstraint = [NSLayoutConstraint
                                            constraintWithItem:_tableView
                                            attribute:NSLayoutAttributeBottom
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.view
                                            attribute:NSLayoutAttributeBottom
                                            multiplier:1
                                            constant:0];
    NSLayoutConstraint *RightConstraint = [NSLayoutConstraint
                                           constraintWithItem:_tableView
                                           attribute:NSLayoutAttributeRight
                                           relatedBy:NSLayoutRelationEqual
                                           toItem:self.view
                                           attribute:NSLayoutAttributeRight
                                           multiplier:1
                                           constant:0];
    
    [NSLayoutConstraint activateConstraints:@[TopConstraint,leftConstraint,BottomConstraint,RightConstraint]];
}

#pragma mark -方法
-(void)presentGraphVC{
    SHGraphViewController *graphVC = [[SHGraphViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:graphVC];
    [self presentViewController:nav animated:YES completion:nil];
}

-(void)presentTextVC{
    SHTextViewController *textVC = [[SHTextViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:textVC];
    [self presentViewController:nav animated:YES completion:nil];
}

-(void)presentImageVC{
    SHImageViewController *imageVC = [[SHImageViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:imageVC];
    [self presentViewController:nav animated:YES completion:nil];
}

-(void)presentPDFVC{
    SHPDFViewController *PDFVC = [[SHPDFViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:PDFVC];
    [self presentViewController:nav animated:YES completion:nil];
}

-(void)presentClipImageVC{
    SHClipImageViewController *clipImageVC = [[SHClipImageViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:clipImageVC];
    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark - Delegate -

#pragma mark -UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",_dataArray[indexPath.row]];
    return cell;
}

#pragma mark -UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            [self presentGraphVC];
            break;
        case 1:
            [self presentTextVC];
            break;
        case 2:
            [self presentImageVC];
            break;
        case 3:
            [self presentPDFVC];
            break;
        case 4:
            [self presentClipImageVC];
            break;
        case 5:
            [self presentClipImageVC];
            break;
        default:
            break;
    }
}


@end
