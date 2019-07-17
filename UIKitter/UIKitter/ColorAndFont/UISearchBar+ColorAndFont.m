//
//  UISearchBar+ColorAndFont.m
//  UIKitter
//
//  Created by Cyfuer on 2019/7/16.
//  Copyright © 2019 Cyfuer. All rights reserved.
//

#import "UISearchBar+ColorAndFont.h"
#import "ColorAndFont.h"
#import <objc/runtime.h>

@implementation UISearchBar (ColorAndFont)

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

@end
