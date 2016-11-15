//
//  UIColor+HW.m
//  Reborn
//
//  Created by tpeng on 2016/11/15.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "UIColor+HW.h"

@implementation UIColor (HW)

+ (UIColor *)colorWithRedValue:(CGFloat)r
                    greenValue:(CGFloat)g
                     blueValue:(CGFloat)b
{
  return [self colorWithRedValue:r greenValue:g blueValue:b alphaValue:1.0];
}

+ (UIColor *)colorWithRedValue:(CGFloat)r greenValue:(CGFloat)g blueValue:(CGFloat)b alphaValue:(CGFloat)a
{
  return [self colorWithRed:r / 255.0
                      green:g / 255.0
                       blue:b / 255.0
                      alpha:a];
}

+ (UIColor*)colorWithHex:(NSInteger)hexValue
{
  return [UIColor colorWithHex:hexValue alpha:1.0];
}

+ (UIColor*)colorWithHex:(NSInteger)hex alpha:(CGFloat)alpha
{
  return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0
                         green:((float)((hex & 0xFF00) >> 8)) / 255.0
                          blue:((float)(hex & 0xFF)) / 255.0
                         alpha:alpha];
}

+ (UIColor *)grayColorWithRGBValue:(CGFloat)rgb
{
  return [self colorWithRedValue:rgb greenValue:rgb blueValue:rgb alphaValue:1.0];
}

+ (UIColor *)grayColorWithRGBValue:(CGFloat)rgb alpha:(CGFloat)alpha
{
  return [self colorWithRedValue:rgb greenValue:rgb blueValue:rgb alphaValue:alpha];
}

+ (UIColor *)randomColor
{
  NSInteger aRedValue   = arc4random() % 255;
  NSInteger aGreenValue = arc4random() % 255;
  NSInteger aBlueValue  = arc4random() % 255;
  UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.0f
                                       green:aGreenValue / 255.0f
                                        blue:aBlueValue / 255.0f
                                       alpha:1.0f];
  return randColor;
}

@end
