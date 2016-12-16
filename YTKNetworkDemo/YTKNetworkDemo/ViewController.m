//
//  ViewController.m
//  YTKNetworkDemo
//
//  Created by HuaTan on 15/12/25.
//  Copyright © 2015年 huatan.com. All rights reserved.
//

#import "ViewController.h"


@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain) UITableView *kTableView;
@property(nonatomic,retain) NSArray     *kTitleArr;
@property(nonatomic,retain) NSArray     *kViewControllers;

@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self uiConfig];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.kTitleArr count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId=@"cellId";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text=self.kTitleArr[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Class className=NSClassFromString(self.kViewControllers[indexPath.row]);
    UIViewController *VC=[[className alloc] init];
    VC.view.backgroundColor=[UIColor whiteColor];
    VC.title=self.kTitleArr[indexPath.row];
    [self.navigationController pushViewController:VC animated:YES];
}

#pragma mark - Private Method

-(void)uiConfig{
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"YTKNetworkDemo";
    [self.view addSubview:self.kTableView];
}

#pragma mark - Lazy Method

-(UITableView *)kTableView{
    if (_kTableView==nil) {
        _kTableView=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _kTableView.tableFooterView=[UIView new];
        _kTableView.dataSource=self;
        _kTableView.delegate=self;
    }
    return _kTableView;
}

-(NSArray *)kTitleArr{
    return @[@"Register",@"CDN",@"BatchRequest",@"ChainRequest",@"LoadCache"];
}

-(NSArray *)kViewControllers{
    return @[@"RegisterViewController",@"CDNViewController",@"BatchRequestViewController"
             ,@"ChainRequestViewController",@"LoadCacheDataViewController"];
}

@end
