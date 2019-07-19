//
//  UISlider+ColorAndFont.m
//  UIKitter
//
//  Created by Cyfuer on 2019/7/16.
//  Copyright © 2019 Cyfuer. All rights reserved.
//

#import "UISlider+ColorAndFont.h"
#import "KitterColorAndFontMacro.h"
#import <objc/runtime.h>

@implementation UISlider (ColorAndFont)

- (void)setKt_leftColor:(NSString *)kt_leftColor {
    KT_SET_COPY_ASSOCIATED(kt_leftColor);
    self.minimumTrackTintColor = kt_kitterColor(kt_leftColor);
}

- (NSString *)kt_leftColor {
    return KT_GET_COPY_ASSOCIATED(kt_leftColor);
}

- (void)setKt_rightColor:(NSString *)kt_rightColor {
    KT_SET_COPY_ASSOCIATED(kt_rightColor);
    self.maximumTrackTintColor = kt_kitterColor(kt_rightColor);
}

- (NSString *)kt_rightColor {
    return KT_GET_COPY_ASSOCIATED(kt_rightColor);
}

- (void)setKt_thumbColor:(NSString *)kt_thumbColor {
    KT_SET_COPY_ASSOCIATED(kt_thumbColor);
    self.thumbTintColor = kt_kitterColor(kt_thumbColor);
}

- (NSString *)kt_thumbColor {
    return KT_GET_COPY_ASSOCIATED(kt_thumbColor);
}

@end
