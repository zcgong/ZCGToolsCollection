//
//  ViewController.m
//  WDownloadProgressView
//
//  Created by 吴伟军 on 15/12/30.
//  Copyright (c) 2015年 吴伟军. All rights reserved.
//

#import "ViewController.h"
#import "WDownloadProgressView.h"
@interface ViewController ()<WDownloadProgressViewDelegate>
@property (nonatomic,retain) WDownloadProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSString *urlString = @"http://yinyueshiting.baidu.com/data2/music/242591530/242591530.mp3?xcode=b33ff7139158c2dbe9c5304b21fec782";
    NSString *urlString = @"http://sm.domob.cn/ugc/151397.mp4";
    
    self.progressView = [[WDownloadProgressView alloc] initWithURL:[NSURL URLWithString:urlString] progressFrame:self.view.bounds font:[UIFont italicSystemFontOfSize:13.0] timeout:5.0 radius:70 alive:YES delegate:self];
    [self.view addSubview:self.progressView];
    // Do any additional setup after loading the view.
}

- (void)progress:(WDownloadProgressView *)progress didFileWithError:(NSError *)error
{
    
}

- (void)progress:(WDownloadProgressView *)progress didFinishWithData:(NSData *)fileData suggestedFilename:(NSString *)filename
{
    [UIView animateWithDuration:2.0 animations:^{
        self.progressView.alpha = 0;
    }];
    [self.progressView performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:2.0];
}

- (void)progressUpdated:(WDownloadProgressView *)progress
{
    
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
