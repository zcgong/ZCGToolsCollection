//
//  SHClipImageViewController.m
//  Quartz 2D 简单使用
//
//  Created by JiKer on 16/5/19.
//  Copyright © 2016年 JiKer. All rights reserved.
//

#import "SHClipImageViewController.h"

@interface SHClipImageViewController ()
{
    SHClipImageView *_clipView;
}
@end

@implementation SHClipImageViewController

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
    
    self.title = @"截图/裁剪图片";
    
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
    
    [self addSliderView];
}

-(void)addTextView{
    _clipView = [[SHClipImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-264)];
    _clipView.radio = 100;
    _clipView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_clipView];
}

-(void)addSliderView{
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(10, kScreenHeight-200, kScreenWidth-20, 50)];
    slider.minimumValue = 0;
    slider.maximumValue = 120;
    slider.value = 100;
    [slider addTarget:self action:@selector(sliderChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
}

#pragma  mark -方法
-(void)backToUp{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)sliderChange:(UISlider *)slider{
    _clipView.radio = slider.value;
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
