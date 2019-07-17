//
//  UITableViewCell+ColorAndFont.m
//  UIKitter
//
//  Created by Cyfuer on 2019/7/16.
//  Copyright © 2019 Cyfuer. All rights reserved.
//

#import "UITableViewCell+ColorAndFont.h"
#import "ColorAndFont.h"
#import <objc/runtime.h>

@implementation UITableViewCell (ColorAndFont)

- (void)setKt_textColor:(NSString *)kt_textColor {
    KT_SET_COPY_ASSOCIATED(kt_textColor);
    self.textColor = kt_kitterColor(kt_textColor);
}

- (NSString *)kt_textColor {
    return KT_GET_COPY_ASSOCIATED(kt_textColor);
}

- (void)setKt_selectedTextColor:(NSString *)kt_selectedTextColor {
    KT_SET_COPY_ASSOCIATED(kt_selectedTextColor);
    self.selectedTextColor = kt_kitterColor(kt_selectedTextColor);
}

- (NSString *)kt_selectedTextColor {
    return KT_GET_COPY_ASSOCIATED(kt_selectedTextColor);
}

@end
