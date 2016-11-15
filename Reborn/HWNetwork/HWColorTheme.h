//
//  HWColorTheme.h
//  ZhongMeBan
//
//  Created by tpeng on 2016/11/4.
//  Copyright © 2016年 ideabinder. All rights reserved.
//

#ifndef HWColorTheme_h
#define HWColorTheme_h

#define COLOR_HEX(hexColor) [UIColor colorWithRed: (((hexColor >> 16) & 0xFF))/255.0f         \
green: (((hexColor >> 8) & 0xFF))/255.0f             \
blue: ((hexColor & 0xFF))/255.0f                    \
alpha: 1]


#define MAIN_VISUAL_COLOR         COLOR_HEX(0x58c4a5)//主色调颜色

#define SEPARATOR_LINE_COLOR      COLOR_HEX(0xEDEDED) //分割线颜色
#define BACKGROUND_COLOR          COLOR_HEX(0xF9F9F9) //背景颜色
#define BULE_COLOR                COLOR_HEX(0x34485e)

#define HEADLINE_TEXT_COLOR       COLOR_HEX(0x2a2a2a) //一级标题字、主要内容
#define BODY_TEXT_COLOR           COLOR_HEX(0x5b5b5b) //正文、普通文字内容
#define SECONDARY_TEXT_COLOR      COLOR_HEX(0x888888) //辅助文字色


#define BLUE_TEXT_COLOR           COLOR_HEX(0x1E7BCD) 




#endif /* HWColorTheme_h */
