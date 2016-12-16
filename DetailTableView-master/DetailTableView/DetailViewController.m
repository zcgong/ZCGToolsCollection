
//
//  DetailViewController.m
//  DetailTableView
//
//  Created by refine on 6/23/16.
//  Copyright © 2016 refine. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailTableCell.h"

static NSString *const cellIdentifier = @"CellIdentifier";

@interface DetailViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Detail Table";
    [self.view addSubview:self.tableView];
}

#pragma mark -TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    __weak typeof(self) weakSelf = self;
    [cell setTapBlock:^(TapActionType type) {
        [weakSelf handleButtonActionWithActionType:type];
    }];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_selectedIndexPath && _selectedIndexPath.row == indexPath.row) {
        _selectedIndexPath = nil;
    } else {
        _selectedIndexPath = indexPath;
    }

    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_selectedIndexPath && _selectedIndexPath.row == indexPath.row) {
        return 120;
    } else {
        return 70;
    }
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"DetailTableCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
    }
    return _tableView;
}

- (void)handleButtonActionWithActionType:(TapActionType)type
{
    NSString *message = @"Good button click";
    if (type == TapActionTypeBad) {
        message = @"Bad button click";
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    [alert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
