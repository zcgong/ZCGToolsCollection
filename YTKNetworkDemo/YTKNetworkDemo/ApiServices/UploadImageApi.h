//
//  UploadImageApi.h
//  YTKNetworkDemo
//
//  Created by HuaTan on 15/12/25.
//  Copyright © 2015年 huatan.com. All rights reserved.
//

#import "YTKRequest.h"

@interface UploadImageApi : YTKRequest

-(id)initWithImage:(UIImage *)image;
-(NSString *)responseImageId;

@end
