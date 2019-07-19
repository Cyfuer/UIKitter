//
//  UINavigationBar+ColorAndFont.m
//  UIKitter
//
//  Created by Cyfuer on 2019/7/16.
//  Copyright © 2019 Cyfuer. All rights reserved.
//

#import "UINavigationBar+ColorAndFont.h"
#import "KitterColorAndFontMacro.h"
#import <objc/runtime.h>

@implementation UINavigationBar (ColorAndFont)

- (void)setKt_tintColor:(NSString *)kt_tintColor {
    KT_SET_COPY_ASSOCIATED(kt_tintColor);
    self.tintColor = kt_kitterColor(kt_tintColor);
}

- (NSString *)kt_tintColor {
    return KT_GET_COPY_ASSOCIATED(kt_tintColor);
}

- (void)setKt_barTintColor:(NSString *)kt_barTintColor {
    KT_SET_COPY_ASSOCIATED(kt_barTintColor);
    self.barTintColor = kt_kitterColor(kt_barTintColor);
}

- (NSString *)kt_barTintColor {
    return KT_GET_COPY_ASSOCIATED(kt_barTintColor);
}

- (void)setKt_titleTextAttributes:(NSString *)kt_titleTextAttributes {
    KT_SET_COPY_ASSOCIATED(kt_titleTextAttributes);
    self.titleTextAttributes = kt_attributedDict(kt_titleTextAttributes);
}

- (NSString *)kt_titleTextAttributes {
    return KT_GET_COPY_ASSOCIATED(kt_titleTextAttributes);
}

- (void)setKt_largeTitleTextAttributes:(NSString *)kt_largeTitleTextAttributes {
    KT_SET_COPY_ASSOCIATED(kt_largeTitleTextAttributes);
    self.largeTitleTextAttributes = kt_attributedDict(kt_largeTitleTextAttributes);
}

- (NSString *)kt_largeTitleTextAttributes {
    return KT_GET_COPY_ASSOCIATED(kt_largeTitleTextAttributes);
}

@end
