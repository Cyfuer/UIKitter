//
//  UIActivityIndicatorView+ColorAndFont.m
//  UIKitter
//
//  Created by Cyfuer on 2019/7/16.
//  Copyright © 2019 Cyfuer. All rights reserved.
//

#import "UIActivityIndicatorView+ColorAndFont.h"
#import "KitterColorAndFontMacro.h"
#import <objc/runtime.h>

@implementation UIActivityIndicatorView(ColorAndFont)

- (void)setKt_color:(NSString *)kt_color {
    KT_SET_COPY_ASSOCIATED(kt_color);
    self.color = kt_kitterColor(kt_color);
}

- (NSString *)kt_color {
    return KT_GET_COPY_ASSOCIATED(kt_color);
}

@end
