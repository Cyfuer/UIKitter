//
//  UITabBar+ColorAndFont.m
//  UIKitter
//
//  Created by Cyfuer on 2019/7/16.
//  Copyright © 2019 Cyfuer. All rights reserved.
//

#import "UITabBar+ColorAndFont.h"
#import "KitterColorAndFontMacro.h"
#import <objc/runtime.h>

@implementation UITabBar (ColorAndFont)

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

- (void)setKt_unselectedItemTintColor:(NSString *)kt_unselectedItemTintColor {
    KT_SET_COPY_ASSOCIATED(kt_unselectedItemTintColor);
    self.unselectedItemTintColor = kt_kitterColor(kt_unselectedItemTintColor);
}

- (NSString *)kt_unselectedItemTintColor {
    return KT_GET_COPY_ASSOCIATED(kt_unselectedItemTintColor);
}

- (void)setKt_selectedImageTintColor:(NSString *)kt_selectedImageTintColor {
    KT_SET_COPY_ASSOCIATED(kt_selectedImageTintColor);
    self.selectedImageTintColor = kt_kitterColor(kt_selectedImageTintColor);
}

- (NSString *)kt_selectedImageTintColor {
    return KT_GET_COPY_ASSOCIATED(kt_selectedImageTintColor);
}

@end
