//
//  UIPageControl+ColorAndFont.m
//  UIKitter
//
//  Created by Cyfuer on 2019/7/16.
//  Copyright © 2019 Cyfuer. All rights reserved.
//

#import "UIPageControl+ColorAndFont.h"
#import "ColorAndFont.h"
#import <objc/runtime.h>

@implementation UIPageControl (ColorAndFont)

- (void)setKt_tintColor:(NSString *)kt_tintColor {
    KT_SET_COPY_ASSOCIATED(kt_tintColor);
    self.pageIndicatorTintColor = kt_kitterColor(kt_tintColor);
}

- (NSString *)kt_tintColor {
    return KT_GET_COPY_ASSOCIATED(kt_tintColor);
}

- (void)setKt_currentTintColor:(NSString *)kt_currentTintColor {
    KT_SET_COPY_ASSOCIATED(kt_currentTintColor);
    self.currentPageIndicatorTintColor = kt_kitterColor(kt_currentTintColor);
}

- (NSString *)kt_currentTintColor {
    return KT_GET_COPY_ASSOCIATED(kt_currentTintColor);
}

@end
