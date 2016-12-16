//
//  UIImageView+CornerRadius.m
//  MyPractise
//
//  Created by lzy on 16/3/1.
//  Copyright © 2016年 lzy. All rights reserved.
//

#import "UIImageView+CornerRadius.h"
#import <objc/runtime.h>

const char kRadius;
const char kRoundingCorners;
const char kIsRounding;
const char kHadAddObserver;
const char kProcessedImage;

static const void *IndieBandNameKey = &IndieBandNameKey;

@implementation UIImageView (CornerRadius)

//失败经历：drawRect
//尝试重写init
//最坏的打算，用swizzleMethod(难度大，不简洁)
//重写setimage
//尝试在layoutSubviews里完成，先调用setImage，再layoutSubviews,ok了（但是在category里重写方法，全局都在调用）

//避免marksToBounds，只能用coreGraphics破坏性地裁剪






/**
 * @brief create Rounding UIImageView, no off-screen-rendered
 */
+ (UIImageView *)zy_roundingRectImageView {
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView zy_cornerRadiusRoundingRect];
    return imageView;
}

/**
 * @brief init the Rounding UIImageView, no off-screen-rendered
 */
- (instancetype)initWithRoundingRectImageView {
    self = [super init];
    if (self) {
        [self zy_cornerRadiusRoundingRect];
    }
    return self;
}

/**
 * @brief create UIImageView with cornerRadius, no off-screen-rendered
 */
+ (UIImageView *)zy_cornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType {
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView zy_cornerRadiusAdvance:cornerRadius rectCornerType:rectCornerType];
    return imageView;
}

/**
 * @brief init the UIImageView with cornerRadius, no off-screen-rendered
 */
- (instancetype)initWithCornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType {
    self = [super init];
    if (self) {
        [self zy_cornerRadiusAdvance:cornerRadius rectCornerType:rectCornerType];
    }
    return self;
}


#pragma mark - Kernel
/**
 * @brief clip the cornerRadius with image, UIImageView must be setFrame before, no off-screen-rendered
 */
- (void)zy_cornerRadiusWithImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType {
    CGSize size = self.bounds.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize cornerRadii = CGSizeMake(cornerRadius, cornerRadius);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    if (nil == UIGraphicsGetCurrentContext()) {
        return;
    }
    UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCornerType cornerRadii:cornerRadii];
    [cornerPath addClip];
    [image drawInRect:self.bounds];
    UIImage *processedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    objc_setAssociatedObject(processedImage, &kProcessedImage, @(1), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.image = processedImage;
}

/**
 * @brief clip the cornerRadius with image, draw the backgroundColor you want, UIImageView must be setFrame before, no off-screen-rendered, no Color Blended layers
 */
- (void)zy_cornerRadiusWithImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType backgroundColor:(UIColor *)backgroundColor {
    CGSize size = self.bounds.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize cornerRadii = CGSizeMake(cornerRadius, cornerRadius);
    
    UIGraphicsBeginImageContextWithOptions(size, YES, scale);
    if (nil == UIGraphicsGetCurrentContext()) {
        return;
    }
    UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCornerType cornerRadii:cornerRadii];
    UIBezierPath *backgroundRect = [UIBezierPath bezierPathWithRect:self.bounds];
    [backgroundColor setFill];
    [backgroundRect fill];
    [cornerPath addClip];
    [image drawInRect:self.bounds];
    UIImage *processedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    objc_setAssociatedObject(processedImage, &kProcessedImage, @(1), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.image = processedImage;
}

/**
 * @brief set cornerRadius for UIImageView, no off-screen-rendered
 */
- (void)zy_cornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType {
    objc_setAssociatedObject(self, &kRadius, @(cornerRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &kRoundingCorners, @(rectCornerType), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &kIsRounding, @(0), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self.class swizzleMethod:@selector(layoutSubviews) anotherMethod:@selector(zy_LayoutSubviews)];
    
    BOOL hadAddObserver = [objc_getAssociatedObject(self, &kHadAddObserver) boolValue];
    if (!hadAddObserver) {
        [self addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
        objc_setAssociatedObject(self, &kHadAddObserver, @(1), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

/**
 * @brief become Rounding UIImageView, no off-screen-rendered
 */
- (void)zy_cornerRadiusRoundingRect {
    objc_setAssociatedObject(self, &kIsRounding, @(1), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self.class swizzleMethod:@selector(layoutSubviews) anotherMethod:@selector(zy_LayoutSubviews)];
    
    BOOL hadAddObserver = [objc_getAssociatedObject(self, &kHadAddObserver) boolValue];
    if (!hadAddObserver) {
        [self addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
        objc_setAssociatedObject(self, &kHadAddObserver, @(1), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}


#pragma mark - Private
+ (void)swizzleMethod:(SEL)oneSel anotherMethod:(SEL)anotherSel {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method oneMethod = class_getInstanceMethod(self, oneSel);
        Method anotherMethod = class_getInstanceMethod(self, anotherSel);
        
        method_exchangeImplementations(oneMethod, anotherMethod);
    });
}

- (void)zy_LayoutSubviews {
    [super layoutSubviews];
    NSNumber *radius = objc_getAssociatedObject(self, &kRadius);
    NSNumber *roundingCorners = objc_getAssociatedObject(self, &kRoundingCorners);
    NSNumber *roundingRect = objc_getAssociatedObject(self, &kIsRounding);
    if (1 == roundingRect.intValue) {
        [self zy_cornerRadiusWithImage:self.image cornerRadius:self.frame.size.width/2 rectCornerType:UIRectCornerAllCorners];
    } else if (nil != radius && nil != roundingCorners && nil != self.image) {
        [self zy_cornerRadiusWithImage:self.image cornerRadius:radius.floatValue rectCornerType:roundingCorners.unsignedLongValue];
    }
}

- (void)dealloc {
    BOOL hadAddObserver = [objc_getAssociatedObject(self, &kHadAddObserver) boolValue];
    if (hadAddObserver) {
        [self removeObserver:self forKeyPath:@"image"];
    }
}


#pragma mark - KVO for .image
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"image"]) {
        UIImage *newImage = change[NSKeyValueChangeNewKey];
        if ([newImage isMemberOfClass:[NSNull class]]) {
            return;
        } else if ([objc_getAssociatedObject(newImage, &kProcessedImage) intValue] == 1) {
            return;
        }
        NSNumber *radius = objc_getAssociatedObject(self, &kRadius);
        NSNumber *roundingCorners = objc_getAssociatedObject(self, &kRoundingCorners);
        NSNumber *roundingRect = objc_getAssociatedObject(self, &kIsRounding);
        if (1 == roundingRect.intValue) {
            [self zy_cornerRadiusWithImage:newImage cornerRadius:self.frame.size.width/2 rectCornerType:UIRectCornerAllCorners];
        } else if (nil != radius && nil != roundingCorners && nil != self.image) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self zy_cornerRadiusWithImage:newImage cornerRadius:radius.floatValue rectCornerType:roundingCorners.unsignedLongValue];
            });
        }
    }
}


@end
