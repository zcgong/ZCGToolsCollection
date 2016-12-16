
#import <UIKit/UIKit.h>

@interface NSNumber (CGFloat)

- (CGFloat)CGFloatValue;

- (id)initWithCGFloat:(CGFloat)value;

+ (NSNumber *)numberWithCGFloat:(CGFloat)value;

@end
