//
//  UIView+ColorAndFont.m
//  UIKitter
//
//  Created by Cyfuer on 2019/7/16.
//  Copyright © 2019 Cyfuer. All rights reserved.
//

#import "UIView+ColorAndFont.h"
#import "KitterColorAndFontMacro.h"
#import <objc/runtime.h>

@implementation UIView(ColorAndFont)

- (void)setKt_backgroundColor:(NSString *)kt_backgroundColor {
    KT_SET_COPY_ASSOCIATED(kt_backgroundColor);
    self.backgroundColor = kt_kitterColor(kt_backgroundColor);
}

- (NSString *)kt_backgroundColor {
    return KT_GET_COPY_ASSOCIATED(kt_backgroundColor);
}

- (void)setKt_tintColor:(NSString *)kt_tintColor {
    KT_SET_COPY_ASSOCIATED(kt_tintColor);
    self.tintColor = kt_kitterColor(kt_tintColor);
}

- (NSString *)kt_tintColor {
    return KT_GET_COPY_ASSOCIATED(kt_tintColor);
}

@end
