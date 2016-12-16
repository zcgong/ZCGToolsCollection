
//https://github.com/thad/ExampleFindFirstResponder

#import <UIKit/UIKit.h>

@interface UIResponder (FirstResponder)
/**
 *  @brief  当前第一响应者
 *
 *  @return 当前第一响应者
 */
+ (id)currentFirstResponder;

@end
