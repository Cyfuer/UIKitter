//
//  UISwitch+ColorAndFont.m
//  UIKitter
//
//  Created by Cyfuer on 2019/7/16.
//  Copyright © 2019 Cyfuer. All rights reserved.
//

#import "UISwitch+ColorAndFont.h"
#import "KitterColorAndFontMacro.h"
#import <objc/runtime.h>

@implementation UISwitch (ColorAndFont)

- (void)setKt_onColor:(NSString *)kt_onColor {
    KT_SET_COPY_ASSOCIATED(kt_onColor);
    self.onTintColor = kt_kitterColor(kt_onColor);
}

- (NSString *)kt_onColor {
    return KT_GET_COPY_ASSOCIATED(kt_onColor);
}

- (void)setKt_color:(NSString *)kt_color {
    KT_SET_COPY_ASSOCIATED(kt_color);
    self.tintColor = kt_kitterColor(kt_color);
}

- (NSString *)kt_color {
    return KT_GET_COPY_ASSOCIATED(kt_color);
}

- (void)setKt_thumbColor:(NSString *)kt_thumbColor {
    KT_SET_COPY_ASSOCIATED(kt_thumbColor);
    self.thumbTintColor = kt_kitterColor(kt_thumbColor);
}

- (NSString *)kt_thumbColor {
    return KT_GET_COPY_ASSOCIATED(kt_thumbColor);
}

@end
