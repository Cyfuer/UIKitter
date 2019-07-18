//
//  UIButton+ColorAndFont.h
//  UIKitter
//
//  Created by Cyfuer on 2019/7/16.
//  Copyright © 2019 Cyfuer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (ColorAndFont)

@property (nonatomic, copy) IBInspectable NSString *kt_normalTitle;
@property (nonatomic, copy) IBInspectable NSString *kt_selectTitle;

@property (nonatomic, copy) IBInspectable NSString *kt_font;
@property (nonatomic, copy) IBInspectable NSString *kt_tintColor;
@property (nonatomic, copy) IBInspectable NSString *kt_normalTitleColor;
@property (nonatomic, copy) IBInspectable NSString *kt_selectTitleColor;
@property (nonatomic, copy) IBInspectable NSString *kt_normalTitleShadowColor;
@property (nonatomic, copy) IBInspectable NSString *kt_selectTitleShadowColor;
@end

NS_ASSUME_NONNULL_END
