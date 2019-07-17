//
//  UIView+ColorAndFont.m
//  UIKitter
//
//  Created by Cyfuer on 2019/7/16.
//  Copyright © 2019 Cyfuer. All rights reserved.
//

#import "UIView+ColorAndFont.h"
#import "ColorAndFont.h"
#import <objc/runtime.h>

@implementation UIView(ColorAndFont)

- (void)setKt_backgroundColor:(NSString *)kt_backgroundColor {
    objc_setAssociatedObject(self, @selector(kt_backgroundColor), kt_backgroundColor, OBJC_ASSOCIATION_COPY);
    self.backgroundColor = kt_kitterColor(kt_backgroundColor);
}

- (NSString *)kt_backgroundColor {
    return objc_getAssociatedObject(self, @selector(kt_backgroundColor));
}

- (void)setKt_tintColor:(NSString *)kt_tintColor {
    objc_setAssociatedObject(self, @selector(kt_tintColor), kt_tintColor, OBJC_ASSOCIATION_COPY);
    self.tintColor = kt_kitterColor(kt_tintColor);
}

- (NSString *)kt_tintColor {
    return objc_getAssociatedObject(self, @selector(kt_tintColor));
}

@end
