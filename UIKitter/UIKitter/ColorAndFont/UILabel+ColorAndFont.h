//
//  UILabel+ColorAndFont.h
//  UIKitter
//
//  Created by Cyfuer on 2019/7/16.
//  Copyright © 2019 Cyfuer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (ColorAndFont)

@property (nonatomic, copy) IBInspectable NSString *kt_font;
@property (nonatomic, copy) IBInspectable NSString *kt_textColor;
@property (nonatomic, copy) IBInspectable NSString *kt_shadowColor;
@property (nonatomic, copy) IBInspectable NSString *kt_highlightedTextColor;

@end

NS_ASSUME_NONNULL_END
