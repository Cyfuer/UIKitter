//
//  KitterColorAndFontMacro.h
//  UIKitter
//
//  Created by Cyfuer on 2019/7/19.
//  Copyright © 2019 Cyfuer. All rights reserved.
//

#ifndef KitterColorAndFontMacro_h
#define KitterColorAndFontMacro_h

static NSInteger KTDefaultFontSize = 16;

static NSString * const KTFontKeyName = @"name"; // 字体名称
static NSString * const KTFontKeyWeight = @"weight";// 字重,
static NSString * const KTFontKeySize = @"size";// 字体大小
static NSString * const KTFontKeyColor = @"color";// 字体颜色
static NSString * const KTFontKeyBackGroundColor = @"backGroundColor";// 字体背景颜色
static NSString * const KTFontKeyKern = @"kern";// 字符间距
static NSString * const KTFontKeyUnderline = @"underline";// 下划线
static NSString * const KTFontKeyUnderlineColor = @"underlineColor";// 下划线颜色
static NSString * const KTFontKeyParagraph = @"paragraph";// 段落样式
static NSString * const KTFontKeyParagraphLineSpacing = @"lineSpacing";// 段落行间距
static NSString * const KTFontKeyParagraphSpacing = @"spacing";// 段落间距
static NSString * const KTFontKeyParagraphAlignment = @"alignment";// 段落对齐方式, left（default）、center、right
static NSString * const KTFontKeyParagraphFirstLineHeadIndent = @"firstLineHeadIndent";// 段落开始的缩进像素
static NSString * const KTFontKeyParagraphHeadIndent = @"headIndent";// 全部文字的缩进像素

#define KT_SET_COPY_ASSOCIATED(key) objc_setAssociatedObject(self, @selector(key), key, OBJC_ASSOCIATION_COPY_NONATOMIC)
#define KT_GET_COPY_ASSOCIATED(key) objc_getAssociatedObject(self, @selector(key))

#define KT_SET_RETAIN_ASSOCIATED(key, obj) objc_setAssociatedObject(self, key, obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC)
#define KT_GET_RETAIN_ASSOCIATED(key) objc_getAssociatedObject(self, key)

#import <UIKit/UIKit.h>

#pragma mark - Unity
static inline BOOL kt_isEmptyString(NSString *string) {
    if ([string isKindOfClass:[NSString class]] || [string isKindOfClass:[NSNull class]]) {
        return (string == nil) || [string isEqual:[NSNull null]] || (string.length == 0) ;
    }
    else {
        return YES;
    }
}

static inline UIColor *kt_colorWithRGBAStr(NSString *rgbaStr) {
    if (kt_isEmptyString(rgbaStr)) {
        return nil;
        
    } else {
        NSArray *colorArr = [rgbaStr componentsSeparatedByString:@","];
        if (colorArr.count != 4) {
            return nil;
        }
        
        int red = [colorArr[0] intValue];
        int green = [colorArr[1] intValue];
        int blue = [colorArr[2] intValue];
        float alpha = [colorArr[3] floatValue];
        
        return [UIColor colorWithRed:red/255.f green:green/255.f blue:blue/255.f alpha:alpha];
    }
}

static inline UIColor *kt_colorWithHexStr(NSString *hexStr) {
    if (kt_isEmptyString(hexStr)) {
        return nil;
        
    } else {
        if ([hexStr hasPrefix:@"#"]) {
            hexStr = [hexStr substringWithRange:NSMakeRange(1, hexStr.length - 1)];
        }
        
        unsigned int red, green, blue;
        
        NSRange range;
        
        range.length =2;
        
        range.location =0;
        
        [[NSScanner scannerWithString:[hexStr substringWithRange:range]] scanHexInt:&red];
        
        range.location =2;
        
        [[NSScanner scannerWithString:[hexStr substringWithRange:range]] scanHexInt:&green];
        
        range.location = 4;
        
        [[NSScanner scannerWithString:[hexStr substringWithRange:range]] scanHexInt:&blue];
        return [UIColor colorWithRed:(float)(red/255.0f)green:(float)(green/255.0f)blue:(float)(blue/255.0f)alpha:1.0f];
    }
}

static inline UIColor *kt_colorWithColorStr(NSString *colorStr) {
    if (kt_isEmptyString(colorStr)) {
        return nil;
    } else if ([colorStr rangeOfString:@","].length > 0) {
        return kt_colorWithRGBAStr(colorStr);
    } else {
        return kt_colorWithHexStr(colorStr);
    }
}

#pragma mark - Color
static inline NSDictionary *kt_kitterColors() {
    static NSDictionary *kitterColors = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *path = [[NSBundle mainBundle] pathForResource:@"KitterColors" ofType:@"plist"];
        kitterColors = [NSDictionary dictionaryWithContentsOfFile:path];
    });
    return kitterColors;
}

static inline UIColor *kt_kitterColor(NSString *key) {
    if (kt_isEmptyString(key)) {
        return nil;
    }
    
    NSString *colorStr = kt_kitterColors()[key];
    return kt_colorWithColorStr(colorStr);
}

#pragma mark - Font
static inline NSDictionary *kt_kitterFonts() {
    static NSDictionary *kitterFonts = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *path = [[NSBundle mainBundle] pathForResource:@"KitterFonts" ofType:@"plist"];
        kitterFonts = [NSDictionary dictionaryWithContentsOfFile:path];
    });
    return kitterFonts;
}

static inline NSDictionary *kt_kitterFont(NSString *key) {
    if (kt_isEmptyString(key)) {
        return nil;
    }
    
    return kt_kitterFonts()[key];
}

static inline UIFont * kt_fontWithKey(NSString *key) {
    
    NSDictionary *fontDict = kt_kitterFont(key);
    if (!fontDict) {
        return nil;
    } else {
        NSString *fontName = [fontDict objectForKey:KTFontKeyName];
        
        UIFont *font = nil;
        
        NSNumber *fontSizeNum = [fontDict objectForKey:KTFontKeySize];
        CGFloat fontSize = fontSizeNum ? [fontSizeNum floatValue] : KTDefaultFontSize;
        
        if (kt_isEmptyString(fontName) || [fontName.lowercaseString containsString:@"pingfang"]) {
            
            NSString *fontWeightStr = [fontDict objectForKey:KTFontKeyWeight];
            if (fontWeightStr) {
                UIFontWeight fontWeight = UIFontWeightRegular;
                NSString *lowerFontWeightStr = fontWeightStr.lowercaseString;
                if ([lowerFontWeightStr isEqualToString:@"uitralight"]) {
                    fontWeight = UIFontWeightUltraLight;
                } else if ([lowerFontWeightStr isEqualToString:@"thin"]) {
                    fontWeight = UIFontWeightThin;
                } else if ([lowerFontWeightStr isEqualToString:@"light"]) {
                    fontWeight = UIFontWeightLight;
                } else if ([lowerFontWeightStr isEqualToString:@"medium"]) {
                    fontWeight = UIFontWeightMedium;
                } else if ([lowerFontWeightStr isEqualToString:@"semibold"]) {
                    fontWeight = UIFontWeightSemibold;
                } else if ([lowerFontWeightStr isEqualToString:@"bold"]) {
                    fontWeight = UIFontWeightBold;
                }
                font = [UIFont systemFontOfSize:fontSize weight:fontWeight];
            } else {
                font = [UIFont systemFontOfSize:fontSize];
            }
        } else {
            font = [UIFont fontWithName:fontName size:fontSize];
        }
        return font;
    }
}

static inline NSDictionary *kt_attributedDict(NSString *key) {
    NSDictionary *fontDict = kt_kitterFont(key);
    if (!fontDict) {
        return nil;
    } else {
        NSMutableDictionary *mutableAttributedDict = [NSMutableDictionary dictionary];
        
        // 字体格式及大小
        UIFont *font = kt_fontWithKey(key);
        if (font) {
            [mutableAttributedDict setObject:font forKey:NSFontAttributeName];
        }
        
        // 字体颜色
        NSString *fontColorStr = [fontDict objectForKey:KTFontKeyColor];
        if (!kt_isEmptyString(fontColorStr)) {
            [mutableAttributedDict setObject:kt_colorWithColorStr(fontColorStr) forKey:NSForegroundColorAttributeName];
        }
        
        // 字体背景颜色
        NSString *fontBgColorStr = [fontDict objectForKey:KTFontKeyBackGroundColor];
        if (!kt_isEmptyString(fontBgColorStr)) {
            [mutableAttributedDict setObject:kt_colorWithColorStr(fontColorStr) forKey:NSBackgroundColorAttributeName];
        }
        
        // 字符间距
        NSNumber *fontKern = [fontDict objectForKey:KTFontKeyKern];
        if (fontKern) {
            [mutableAttributedDict setObject:fontKern forKey:NSKernAttributeName];
        }
        
        // 删除线
        BOOL fontUnderline = [fontDict objectForKey:KTFontKeyUnderline];
        if (fontUnderline) {
            [mutableAttributedDict setObject:@(NSUnderlineStyleSingle) forKey:NSStrikethroughStyleAttributeName];
        }
        
        // 删除线颜色
        NSString *fontUnderlineColorStr = [fontDict objectForKey:KTFontKeyUnderlineColor];
        if (!kt_isEmptyString(fontUnderlineColorStr)) {
            [mutableAttributedDict setObject:kt_colorWithColorStr(fontUnderlineColorStr) forKey:NSStrikethroughColorAttributeName];
        }
        
        // 字体背景颜色
        NSDictionary *fontParagraph = [fontDict objectForKey:KTFontKeyParagraph];
        if (fontParagraph) {
            NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc]init];
            
            // 行间距
            NSNumber *paragraphLineSpacing = [fontDict objectForKey:KTFontKeyParagraphLineSpacing];
            if (paragraphLineSpacing) {
                paragraph.lineSpacing = [paragraphLineSpacing floatValue];
            }
            
            // 段落间距
            NSNumber *paragraphSpacing = [fontDict objectForKey:KTFontKeyParagraphSpacing];
            if (paragraphSpacing) {
                paragraph.paragraphSpacing = [paragraphSpacing floatValue];
            }
            
            // 对齐方式
            NSString *paragraphAlignment = [fontDict objectForKey:KTFontKeyParagraphAlignment];
            if (!kt_isEmptyString(paragraphAlignment)) {
                if ([paragraphAlignment.lowercaseString isEqualToString:@"left"]) {
                    paragraph.alignment = NSTextAlignmentLeft;
                } else if ([paragraphAlignment.lowercaseString isEqualToString:@"center"]) {
                    paragraph.alignment = NSTextAlignmentCenter;
                } else if ([paragraphAlignment.lowercaseString isEqualToString:@"right"]) {
                    paragraph.alignment = NSTextAlignmentRight;
                }
            }
            
            // 段落开始的缩进像素
            NSNumber *paragraphFirstLineHeadIndent = [fontDict objectForKey:KTFontKeyParagraphFirstLineHeadIndent];
            if (paragraphFirstLineHeadIndent) {
                paragraph.firstLineHeadIndent = [paragraphFirstLineHeadIndent floatValue];
            }
            
            // 段落间距
            NSNumber *paragraphHeadIndent = [fontDict objectForKey:KTFontKeyParagraphHeadIndent];
            if (paragraphHeadIndent) {
                paragraph.headIndent = [paragraphHeadIndent floatValue];
            }
            
            [mutableAttributedDict setObject:paragraph forKey:NSParagraphStyleAttributeName];
        }
        
        return (NSDictionary *)mutableAttributedDict;
    }
}

#endif /* KitterColorAndFontMacro_h */
