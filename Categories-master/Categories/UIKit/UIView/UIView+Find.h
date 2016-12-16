
#import <UIKit/UIKit.h>

@interface UIView (Find)

/** 找到指定类名的subView */
- (UIView *)findSubViewWithClass:(Class)clazz;

- (NSArray *)findAllSubViewsWithClass:(Class)clazz;

/** 找到指定类名的superView对象 */
- (UIView *)findSuperViewWithClass:(Class)clazz;

/** 找到view上的第一响应者 */
- (UIView *)findFirstResponder;

/** 找到当前view所在的viewcontroler */
- (UIViewController *)findViewController;

- (NSArray *)allSubviews;

- (void)removeAllSubviews;

@end
