//
//  UIImageView+ColorAndFont.m
//  UIKitter
//
//  Created by Cyfuer on 2019/7/16.
//  Copyright © 2019 Cyfuer. All rights reserved.
//

#import "UIImageView+ColorAndFont.h"
#import "ColorAndFont.h"
#import <objc/runtime.h>

@implementation UIImageView(ColorAndFont)

- (void)setKt_tintColor:(NSString *)kt_tintColor {
    objc_setAssociatedObject(self, @selector(kt_tintColor), kt_tintColor, OBJC_ASSOCIATION_COPY);
    self.tintColor = kt_kitterColor(kt_tintColor);
}

- (NSString *)kt_tintColor {
    return objc_getAssociatedObject(self, @selector(kt_tintColor));
}

@end
