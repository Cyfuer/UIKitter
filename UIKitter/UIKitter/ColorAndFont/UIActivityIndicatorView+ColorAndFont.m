//
//  UIActivityIndicatorView+ColorAndFont.m
//  UIKitter
//
//  Created by Cyfuer on 2019/7/16.
//  Copyright © 2019 Cyfuer. All rights reserved.
//

#import "UIActivityIndicatorView+ColorAndFont.h"
#import "ColorAndFont.h"
#import <objc/runtime.h>

@implementation UIActivityIndicatorView(ColorAndFont)

- (void)setKt_color:(NSString *)kt_color {
    objc_setAssociatedObject(self, @selector(kt_color), kt_color, OBJC_ASSOCIATION_COPY);
    self.color = kt_kitterColor(kt_color);
}

- (NSString *)kt_color {
    return objc_getAssociatedObject(self, @selector(kt_color));
}

@end
