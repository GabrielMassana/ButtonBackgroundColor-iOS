//
//  UIButton+BBCBackgroundColor.m
//  ButtonBackgroundColor
//
//  Created by GabrielMassana on 21/01/2016.
//  Copyright © 2016 GabrielMassana. All rights reserved.
//

#import "UIButton+BBCBackgroundColor.h"

#import <objc/runtime.h>

/**
 Key for a normal backgroundColor.
 */
static void const *BBCBackgroundColorNormal = &BBCBackgroundColorNormal;

/**
 Key for a selected backgroundColor.
 */
static void const *BBCBackgroundColorSelected = &BBCBackgroundColorSelected;

@implementation UIButton (BBCBackgroundColor)

#pragma mark - BackgroundColor

- (void)bbc_backgroundColorNormal:(UIColor *)normal
          backgroundColorSelected:(UIColor *)selected
{
    //set normal background color
    self.backgroundColor = normal;
    
    //handle states
    [self addTarget:self
             action:@selector(buttonTouchUpInside:)
   forControlEvents:UIControlEventTouchUpInside];
    
    [self addTarget:self
             action:@selector(buttonTouchUpOutside:)
   forControlEvents:UIControlEventTouchUpOutside];
    
    [self addTarget:self
             action:@selector(buttonTouchDown:)
   forControlEvents:UIControlEventTouchDown];
    
    [self addTarget:self
             action:@selector(buttonTouchCancel:)
   forControlEvents:UIControlEventTouchCancel];
    
    //store colors
    [self setNormalBackgroundColor:normal];
    [self setSelectedBackgroundColor:selected];
}

#pragma mark - Setters

- (void)setNormalBackgroundColor:(UIColor *)normal
{
    objc_setAssociatedObject(self,
                             BBCBackgroundColorNormal,
                             normal,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setSelectedBackgroundColor:(UIColor *)selected
{
    objc_setAssociatedObject(self,
                             BBCBackgroundColorSelected,
                             selected,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Getters

- (UIColor *)normalBackgroundColor
{
    return objc_getAssociatedObject(self,
                                    BBCBackgroundColorNormal);
}

- (UIColor *)selectedBackgroundColor
{
    return objc_getAssociatedObject(self,
                                    BBCBackgroundColorSelected);
}

#pragma mark - ButtonActions

- (void)buttonTouchUpInside:(UIButton *)sender
{
    sender.backgroundColor = self.normalBackgroundColor;
}

- (void)buttonTouchUpOutside:(UIButton *)sender
{
    sender.backgroundColor = self.normalBackgroundColor;
}

- (void)buttonTouchDown:(UIButton *)sender
{
    sender.backgroundColor = self.selectedBackgroundColor;
}

- (void)buttonTouchCancel:(UIButton *)sender
{
    sender.backgroundColor = self.normalBackgroundColor;
}

@end
