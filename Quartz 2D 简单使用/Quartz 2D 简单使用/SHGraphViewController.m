//
//  SHGraphViewController.m
//  Quartz 2D 简单使用
//
//  Created by JiKer on 16/5/18.
//  Copyright © 2016年 JiKer. All rights reserved.
//

#import "SHGraphViewController.h"

@interface SHGraphViewController ()
{
    UITableView *_tableView;
    NSArray *_dataArray;
    SHPresentView *_presentView;
}
@end

@implementation SHGraphViewController

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
    [self setNavigationBar];
}

-(void)setNavigationBar{
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:220/255.0 green:0 blue:39/255.0 alpha:1];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    
    self.title = @"绘制图形";
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 20, 20);
    [leftBtn setImage:[UIImage imageNamed:@"leftArrow.png"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(backToUp) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftBar;
}

#pragma mark -数据
-(void)getData{
    _dataArray = @[@"Line",
                   @"Rect",
                   @"Ellipse",
                   @"Arc",
                   @"Lines",
                   @"Curve"];
    [self addUI];
}

#pragma mark -界面

-(void)addUI{
    [self addTableView];
    [self addPresntView];
}

-(void)addTableView{
    _tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [_tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
    
    UILabel *headerLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    headerLbl.backgroundColor = [UIColor whiteColor];
    headerLbl.font = [UIFont systemFontOfSize:14];
    headerLbl.text = @"图形:";
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
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint
                                           constraintWithItem:_tableView
                                           attribute:NSLayoutAttributeWidth
                                           relatedBy:NSLayoutRelationEqual
                                           toItem:nil
                                           attribute:NSLayoutAttributeNotAnAttribute
                                           multiplier:1
                                           constant:100];
    
    [NSLayoutConstraint activateConstraints:@[TopConstraint,leftConstraint,BottomConstraint,widthConstraint]];
}

-(void)addPresntView{
    _presentView = [[SHPresentView alloc]initWithFrame:CGRectZero];
    _presentView.backgroundColor = [UIColor yellowColor];
    _presentView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_presentView];
    
    [_presentView setUpPropery:0];
    
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint
                                         constraintWithItem:_presentView
                                         attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
                                         toItem:_tableView
                                         attribute:NSLayoutAttributeTop
                                         multiplier:1
                                         constant:0];
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint
                                         constraintWithItem:_presentView
                                         attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual
                                         toItem:_tableView
                                         attribute:NSLayoutAttributeRight
                                         multiplier:1
                                         constant:0];
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint
                                         constraintWithItem:_presentView
                                         attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual
                                         toItem:_tableView
                                         attribute:NSLayoutAttributeBottom
                                         multiplier:1
                                         constant:0];
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint
                                         constraintWithItem:_presentView
                                         attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual
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
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",_dataArray[indexPath.row]];
    return cell;
}

#pragma mark -UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    [_presentView setUpPropery:indexPath.row];
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
