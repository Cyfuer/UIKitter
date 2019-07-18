//
//  UINavigationBar+ColorAndFont.h
//  UIKitter
//
//  Created by Cyfuer on 2019/7/16.
//  Copyright © 2019 Cyfuer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationBar (ColorAndFont)

@property (nonatomic, copy) IBInspectable NSString *kt_tintColor;
@property (nonatomic, copy) IBInspectable NSString *kt_barTintColor;
@property (nonatomic, copy) IBInspectable NSString *kt_titleTextAttributes;
@property (nonatomic, copy) IBInspectable NSString *kt_largeTitleTextAttributes;

@end

NS_ASSUME_NONNULL_END
