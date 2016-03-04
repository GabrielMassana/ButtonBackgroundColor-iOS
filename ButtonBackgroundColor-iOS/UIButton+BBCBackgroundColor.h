//
//  UIButton+BBCBackgroundColor.h
//  ButtonBackgroundColor
//
//  Created by GabrielMassana on 21/01/2016.
//  Copyright © 2016 GabrielMassana. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Category to handle the background color of a UIButton in normal and highlighted state.
 */
@interface UIButton (BBCBackgroundColor)

/**
 Sets the background colors to use in normal and selected button state.
 
 @param normal - the color for a normal state.
 @param selected - the color for a selected state.
 
 @deprecated Deprecated since 1.0.8
 
 @note Please use instead:  @code bbc_backgroundColorNormal:backgroundColorHighlighted: @endcode
 */
- (void)bbc_backgroundColorNormal:(UIColor *)normal
          backgroundColorSelected:(UIColor *)selected __attribute__((deprecated));

/**
 Sets the background colors to use in normal and highlighted button state.
 
 @param normal - the color for a normal state.
 @param highlighted - the color for a highlighted state.
 */
- (void)bbc_backgroundColorNormal:(UIColor *)normal
       backgroundColorHighlighted:(UIColor *)highlighted;

/**
 The color for a normal state.
 */
@property (nonatomic, strong) UIColor *normalBackgroundColor;

/**
 The color for a highlighted state.
 */
@property (nonatomic, strong) UIColor *highlightedBackgroundColor;

@end
