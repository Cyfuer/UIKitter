//
//  UISwitch+ColorAndFont.h
//  UIKitter
//
//  Created by Cyfuer on 2019/7/16.
//  Copyright © 2019 Cyfuer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UISwitch (ColorAndFont)

@property (nonatomic, copy) IBInspectable NSString *kt_onColor;
@property (nonatomic, copy) IBInspectable NSString *kt_color;
@property (nonatomic, copy) IBInspectable NSString *kt_thumbColor;

@end

NS_ASSUME_NONNULL_END
