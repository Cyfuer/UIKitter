//
//  UITextField+ColorAndFont.m
//  UIKitter
//
//  Created by Cyfuer on 2019/7/16.
//  Copyright © 2019 Cyfuer. All rights reserved.
//

#import "UITextField+ColorAndFont.h"
#import "KitterColorAndFontMacro.h"
#import <objc/runtime.h>

@implementation UITextField (ColorAndFont)

- (void)setKt_font:(NSString *)kt_font {
    KT_SET_COPY_ASSOCIATED(kt_font);
    self.font = kt_fontWithKey(kt_font);
}

- (NSString *)kt_font {
    return KT_GET_COPY_ASSOCIATED(kt_font);
}

- (void)setKt_textColor:(NSString *)kt_textColor {
    KT_SET_COPY_ASSOCIATED(kt_textColor);
    self.textColor = kt_kitterColor(kt_textColor);
}

- (NSString *)kt_textColor {
    return KT_GET_COPY_ASSOCIATED(kt_textColor);
}

@end
