//
//  DLSkinTool.m
//  ChangeSkinColor
//
//  Created by weishine on 16/6/6.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "DLSkinTool.h"
#import <UIKit/UIKit.h>

static NSString *_skinColor;

@implementation DLSkinTool

Singleton_m(DLSkinTool, SkinTool)

+ (void)initialize{
    _skinColor = [[NSUserDefaults standardUserDefaults] objectForKey:@"skinColor"];
    if (_skinColor == nil) {
        _skinColor = @"blue";
    }
}

+ (void)setSkinColor:(NSString *)skinColor{
    
    _skinColor = skinColor;
    
    // 记录用户选择的皮肤
    [[NSUserDefaults standardUserDefaults]setObject:skinColor forKey:@"skinColor"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
}

+ (UIImage *)skinToolWithImageName:(NSString *)imageName{
    
    // 拼接image前面的路径
    NSString *imageNamePath = [NSString stringWithFormat:@"skin/%@/%@",_skinColor,imageName];
    
    // 创建对应UIImage对象
    return [UIImage imageNamed:imageNamePath];
}

+ (UIColor *)bgColor
{
    // 1.获取plist文件的路径
    NSString *fileName = [NSString stringWithFormat:@"skin/%@/bgColor.plist", _skinColor];
    NSString *bgColorFilePath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    
    // 2.加载plist文件
    NSDictionary *bgColorDict = [NSDictionary dictionaryWithContentsOfFile:bgColorFilePath];
    
    // 3.获取字典中对应的RGB的值
    NSString *bgColorString = bgColorDict[@"bgColor"];
    
    // 4.取出对应的RGB值
    NSArray *bgColorArray = [bgColorString componentsSeparatedByString:@","];
    NSInteger red = [bgColorArray[0] integerValue];
    NSInteger green = [bgColorArray[1] integerValue];
    NSInteger blue = [bgColorArray[2] integerValue];
    
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
}




@end
