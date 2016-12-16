//
//  ViewController.m
//  ZYCornerRadiusImageView
//
//  Created by lzy on 16/3/3.
//  Copyright © 2016年 lzy. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+CornerRadius.h"
#import "ZYImageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
#pragma notification --- 本工具提供两种使用方式，UIImageView+CornerRadius较方便，若不喜欢使用Category方式则可以使用ZYImageView。
    
    
    
    #pragma mark --- UIImageView+CornerRadius
#pragma mark - 圆形
    UIImageView *imageView = [[UIImageView alloc] initWithRoundingRectImageView];
    imageView.image = [UIImage imageNamed:@"mac_dog"];
    
    
//    UIImageView *imageView = [[UIImageView alloc] init];
//    [imageView zy_cornerRadiusRoundingRect];
//    imageView.image = [UIImage imageNamed:@"mac_dog"];
    

#pragma mark - 圆角一直有效
//    UIImageView *imageView = [[UIImageView alloc] init];
//    [imageView zy_cornerRadiusAdvance:100.0f rectCornerType:UIRectCornerAllCorners];
//    imageView.image = [UIImage imageNamed:@"mac_dog"];
    
    
//    UIImageView *imageView = [[UIImageView alloc] initWithCornerRadiusAdvance:20.0f rectCornerType:UIRectCornerAllCorners];
//    imageView.image = [UIImage imageNamed:@"mac_dog"];
    
    
#pragma mark - (with image)圆角一次性有效
    
//    UIImageView *imageView = [[UIImageView alloc] init];
//    [imageView setFrame:CGRectMake(100, 300, 200, 200)];
//    //需先有Frame
//    [imageView zy_cornerRadiusWithImage:[UIImage imageNamed:@"mac_dog"] cornerRadius:100.0f rectCornerType:UIRectCornerAllCorners];
//    //当次有效，再次setImage则无圆角
////    imageView.image = [UIImage imageNamed:@"mac_dog"];
    
    
    
    
    
    

    #pragma mark --- ZYImageView
    
//    ZYImageView *imageView = [[ZYImageView alloc] init];
//    [imageView zy_cornerRadiusAdvance:100.0f rectCornerType:UIRectCornerAllCorners];
//    imageView.image = [UIImage imageNamed:@"mac_dog"];

    
    
//    ZYImageView *imageView = [[ZYImageView alloc] initWithCornerRadiusAdvance:100.0f rectCornerType:UIRectCornerAllCorners];
//    imageView.image = [UIImage imageNamed:@"mac_dog"];
    
    
    
//    ZYImageView *imageView = [ZYImageView zy_cornerRadiusAdvance:100.0f rectCornerType:UIRectCornerAllCorners];
//    imageView.image = [UIImage imageNamed:@"mac_dog"];
    
    
    
//    ZYImageView *imageView = [[ZYImageView alloc] initWithRoundingRectImageView];
//    imageView.image = [UIImage imageNamed:@"mac_dog"];
//    [imageView zy_cornerRadiusAdvance:30.0f rectCornerType:UIRectCornerAllCorners];
    
    
    
//    ZYImageView *imageView = [[ZYImageView alloc] init];
//    [imageView setFrame:CGRectMake(100, 300, 200, 200)];
//    //带image的zy_cornerRadius需先有Frame，而且效果单次有效
//    [imageView zy_cornerRadiusWithImage:[UIImage imageNamed:@"mac_dog"] cornerRadius:30.0f rectCornerType:UIRectCornerAllCorners];
//    //当次有效，再次setImage则无圆角
////    imageView.image = [UIImage imageNamed:@"mac_dog"];
    
    
    
    
    [imageView setFrame:CGRectMake(80, 250, 200, 200)];
    [self.view addSubview:imageView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


