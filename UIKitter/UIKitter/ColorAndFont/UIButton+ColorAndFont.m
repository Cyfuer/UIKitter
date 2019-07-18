//
//  UIButton+ColorAndFont.m
//  UIKitter
//
//  Created by Cyfuer on 2019/7/16.
//  Copyright © 2019 Cyfuer. All rights reserved.
//

#import "UIButton+ColorAndFont.h"
#import "ColorAndFont.h"
#import <objc/runtime.h>

@implementation UIButton (ColorAndFont)

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
    SEL setTitleSelector = @selector(setTitle:forState:);
    Method setTitleMethod = class_getInstanceMethod(clazz, setTitleSelector);
    
    // 获取替换原setText实现方法的hs_setText selector、method、IMP
    SEL kt_setTitleSelector = @selector(kt_setTitle:forState:);
    Method kt_setTitleMethod = class_getInstanceMethod(clazz, kt_setTitleSelector);
    
    // 交换
    method_exchangeImplementations(setTitleMethod, kt_setTitleMethod);
}

- (void)kt_setTitle:(NSString *)title forState:(UIControlState)state {
    [self kt_setTitle:title forState:state];
    
    NSDictionary *attributedDict = (NSDictionary *)KT_GET_RETAIN_ASSOCIATED(@"kt_font");
    if (attributedDict && title && title.length > 0) {
        NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:title attributes:attributedDict];
        [self setAttributedTitle:attributedTitle forState:state];
    }
}

- (void)setKt_normalTitle:(NSString *)kt_normalTitle {
    [self setTitle:kt_normalTitle forState:UIControlStateNormal];
}

- (NSString *)kt_normalTitle {
    return [self titleForState:UIControlStateNormal];
}

- (void)setKt_selectTitle:(NSString *)kt_selectTitle {
    [self setTitle:kt_selectTitle forState:UIControlStateSelected];
}

- (NSString *)kt_selectTitle {
    return [self titleForState:UIControlStateSelected];
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

- (void)setKt_tintColor:(NSString *)kt_tintColor {
    KT_SET_COPY_ASSOCIATED(kt_tintColor);
    self.tintColor = kt_kitterColor(kt_tintColor);
}

- (NSString *)kt_tintColor {
    return KT_GET_COPY_ASSOCIATED(kt_tintColor);
}

- (void)setKt_normalTitleColor:(NSString *)kt_normalTitleColor {
    KT_SET_COPY_ASSOCIATED(kt_normalTitleColor);
    [self setTitleColor:kt_kitterColor(kt_normalTitleColor) forState:UIControlStateNormal];
}

- (NSString *)kt_normalTitleColor {
    return KT_GET_COPY_ASSOCIATED(kt_normalTitleColor);
}

- (void)setKt_selectTitleColor:(NSString *)kt_selectTitleColor {
    KT_SET_COPY_ASSOCIATED(kt_selectTitleColor);
    [self setTitleColor:kt_kitterColor(kt_selectTitleColor) forState:UIControlStateSelected];
}

- (NSString *)kt_selectTitleColor {
    return KT_GET_COPY_ASSOCIATED(kt_selectTitleColor);
}

- (void)setKt_normalTitleShadowColor:(NSString *)kt_normalTitleShadowColor {
    KT_SET_COPY_ASSOCIATED(kt_normalTitleShadowColor);
    [self setTitleShadowColor:kt_kitterColor(kt_normalTitleShadowColor) forState:UIControlStateNormal];
}

- (NSString *)kt_normalTitleShadowColor {
    return KT_GET_COPY_ASSOCIATED(kt_normalTitleShadowColor);
}

- (void)setKt_selectTitleShadowColor:(NSString *)kt_selectTitleShadowColor {
    KT_SET_COPY_ASSOCIATED(kt_selectTitleShadowColor);
    [self setTitleShadowColor:kt_kitterColor(kt_selectTitleShadowColor) forState:UIControlStateSelected];
}

- (NSString *)kt_selectTitleShadowColor {
    return KT_GET_COPY_ASSOCIATED(kt_selectTitleShadowColor);
}

@end
