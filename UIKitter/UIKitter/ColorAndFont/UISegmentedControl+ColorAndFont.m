//
//  UISegmentedControl+ColorAndFont.m
//  UIKitter
//
//  Created by Cyfuer on 2019/7/16.
//  Copyright © 2019 Cyfuer. All rights reserved.
//

#import "UISegmentedControl+ColorAndFont.h"
#import "KitterColorAndFontMacro.h"
#import <objc/runtime.h>

@implementation UISegmentedControl (ColorAndFont)

- (void)setKt_tintColor:(NSString *)kt_tintColor {
    KT_SET_COPY_ASSOCIATED(kt_tintColor);
    self.tintColor = kt_kitterColor(kt_tintColor);
}

- (NSString *)kt_tintColor {
    return KT_GET_COPY_ASSOCIATED(kt_tintColor);
}

@end
