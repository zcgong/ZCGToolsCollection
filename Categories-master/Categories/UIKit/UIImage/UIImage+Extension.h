
//https://github.com/CompletionHandler/CYImageCompress

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/** 压缩图片 最大字节大小为maxLength */
- (NSData *)compressWithMaxLength:(NSInteger)maxLength;

@end
