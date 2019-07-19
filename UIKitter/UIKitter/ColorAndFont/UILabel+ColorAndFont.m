//
//  UILabel+ColorAndFont.m
//  UIKitter
//
//  Created by Cyfuer on 2019/7/16.
//  Copyright © 2019 Cyfuer. All rights reserved.
//

#import "UILabel+ColorAndFont.h"
#import "KitterColorAndFontMacro.h"
#import <objc/runtime.h>

@implementation UILabel(ColorAndFont)

+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id obj = [[self alloc] init];
        [obj swizzleIMP];
    });
}

- (void)swizzleIMP {
    Class clazz = [self class];
    
    // 获取UILabel setText的selector、method、IMP
    SEL setTextSelector = @selector(setText:);
    Method setTextMethod = class_getInstanceMethod(clazz, setTextSelector);
    
    // 获取替换原setText实现方法的hs_setText selector、method、IMP
    SEL kt_setTextSelector = @selector(kt_setText:);
    Method kt_setTextMethod = class_getInstanceMethod(clazz, kt_setTextSelector);
    
    // 交换
    method_exchangeImplementations(setTextMethod, kt_setTextMethod);
}

- (void)setKt_textColor:(NSString *)kt_textColor {
    KT_SET_COPY_ASSOCIATED(kt_textColor);
    self.textColor = kt_kitterColor(kt_textColor);
}

- (NSString *)kt_textColor {
    return KT_GET_COPY_ASSOCIATED(kt_textColor);
}

- (void)setKt_shadowColor:(NSString *)kt_shadowColor {
    KT_SET_COPY_ASSOCIATED(kt_shadowColor);
    self.shadowColor = kt_kitterColor(kt_shadowColor);
}

- (NSString *)kt_shadowColor {
    return KT_GET_COPY_ASSOCIATED(kt_shadowColor);
}

- (void)setKt_highlightedTextColor:(NSString *)kt_highlightedTextColor {
    KT_SET_COPY_ASSOCIATED(kt_highlightedTextColor);
    self.highlightedTextColor = kt_kitterColor(kt_highlightedTextColor);
}

- (NSString *)kt_highlightedTextColor {
    return KT_GET_COPY_ASSOCIATED(kt_highlightedTextColor);
}

- (void)setKt_font:(NSString *)kt_font {
    KT_SET_COPY_ASSOCIATED(kt_font);
    NSDictionary *attributedDict = kt_attributedDict(kt_font);
    if (attributedDict) {
        KT_SET_RETAIN_ASSOCIATED(@"kt_font", attributedDict);
    }
}

- (NSString *)kt_font {
    return KT_GET_COPY_ASSOCIATED(kt_font);
}

- (void)kt_setText:(NSString *)text
{
    [self kt_setText:text];
    
    NSDictionary *attributedDict = (NSDictionary *)KT_GET_RETAIN_ASSOCIATED(@"kt_font");
    if (attributedDict && text && text.length > 0) {
        self.attributedText = [[NSAttributedString alloc] initWithString:text attributes:attributedDict];
    }
}

@end
