//
//  UIProgressView+ColorAndFont.m
//  UIKitter
//
//  Created by Cyfuer on 2019/7/16.
//  Copyright © 2019 Cyfuer. All rights reserved.
//

#import "UIProgressView+ColorAndFont.h"
#import "ColorAndFont.h"
#import <objc/runtime.h>

@implementation UIProgressView (ColorAndFont)

- (void)setKt_progressTintColor:(NSString *)kt_progressTintColor {
    KT_SET_COPY_ASSOCIATED(kt_progressTintColor);
    self.progressTintColor = kt_kitterColor(kt_progressTintColor);
}

- (NSString *)kt_progressTintColor {
    return KT_GET_COPY_ASSOCIATED(kt_progressTintColor);
}

- (void)setKt_trackTintColor:(NSString *)kt_trackTintColor {
    KT_SET_COPY_ASSOCIATED(kt_trackTintColor);
    self.trackTintColor = kt_kitterColor(kt_trackTintColor);
}

- (NSString *)kt_trackTintColor {
    return KT_GET_COPY_ASSOCIATED(kt_trackTintColor);
}

@end
