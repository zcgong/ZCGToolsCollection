//
//  GlobalObject.h
//  对NSArray中的自定义对象进行排序
//
//  Created by JiKer on 16/1/25.
//  Copyright © 2016年 JiKer. All rights reserved.
//

#ifndef GlobalObject_h
#define GlobalObject_h

//获取屏幕宽高
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

//打印当前函数或方法（在C++中会包含参数类型），c字符串
#define PrintCurrentMethodName NSLog(@"%s",__PRETTY_FUNCTION__)
//打印当前文件路径，c字符串
#define PrintCurrentFilePath NSLog(@"%s", __FILE__);
//打印当前行号，整数
#define PrintCurrentLineNumber NSLog(@"%d", __LINE__);

//获取系统版本
#define iOSVersion [[UIDevice currentDevice].systemVersion floatValue]

//rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//NSUserDefaults 实例化
#define USER_DEFAULTS [NSUserDefaults standardUserDefaults]


#endif /* GlobalObject_h */
