//
//  DLSkinTool.h
//  ChangeSkinColor
//
//  Created by weishine on 16/6/6.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Singleton.h"

@interface DLSkinTool : NSObject

Singleton_h(SkinTool)

/** 告知工具类当前皮肤的颜色 */
+ (void)setSkinColor:(NSString *)skinColor;

/** 传入图片名称,返回对应皮肤下图片的UIImage对象 */
+ (UIImage *)skinToolWithImageName:(NSString *)imageName;

/** 调用该方法,直接返回当前皮肤对应的UIColor对象 */
+ (UIColor *)bgColor;


@end
