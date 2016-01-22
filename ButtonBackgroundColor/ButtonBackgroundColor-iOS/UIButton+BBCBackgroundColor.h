//
//  UIButton+BBCBackgroundColor.h
//  ButtonBackgroundColor
//
//  Created by GabrielMassana on 21/01/2016.
//  Copyright © 2016 GabrielMassana. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Category to handle the background color of a UIButton in normal and selected state.
 */
@interface UIButton (BBCBackgroundColor)

/**
 Sets the background colors to use in normal and selected button state.
 
 @param normal - the color for a normal state.
 @param selected - the color for a selected state.
 */
- (void)bbc_backgroundColorNormal:(UIColor *)normal
          backgroundColorSelected:(UIColor *)selected;

/**
 The color for a normal state.
 */
@property (nonatomic, strong) UIColor *normalBackgroundColor;

/**
 The color for a selected state.
 */
@property (nonatomic, strong) UIColor *selectedBackgroundColor;

@end
