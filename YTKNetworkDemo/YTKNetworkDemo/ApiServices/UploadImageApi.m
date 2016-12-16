//
//  UploadImageApi.m
//  YTKNetworkDemo
//
//  Created by HuaTan on 15/12/25.
//  Copyright © 2015年 huatan.com. All rights reserved.
//

#import "UploadImageApi.h"

@interface UploadImageApi ()

@property(nonatomic,retain) UIImage *kImage;

@end

@implementation UploadImageApi


//通过覆盖constructingBodyBlock方法，来方便地上传图片等附件
//通过如上代码，我们创建了一个上传图片，然后获得服务器返回的 imageId 的网络请求Api。

#pragma mark - Public Method

-(id)initWithImage:(UIImage *)image{
    self=[super init];
    if (self) {
        _kImage=image;
    }
    return self;
}

-(NSString *)responseImageId{
    NSDictionary *dict=self.responseJSONObject;
    return dict[@"imageId"];
}

#pragma mark - Override

-(YTKRequestMethod)requestMethod{
    return YTKRequestMethodPost;
}

-(NSString *)requestUrl{
    return @"/iphone/image/upload";
}

-(AFConstructingBlock)constructingBodyBlock{
    return ^(id<AFMultipartFormData>formData){
        NSData *data=UIImageJPEGRepresentation(_kImage, 0.9);
        NSString *name=@"image";
        NSString *fomrKey=@"image";
        NSString *type=@"image/jpeg";
        [formData appendPartWithFileData:data name:fomrKey fileName:name mimeType:type];
    };
}

-(id)jsonValidator{
    return @{@"imageId":[NSString class]};
}

@end
