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
 Key for a highlighted backgroundColor.
 */
static void const *BBCBackgroundColorHighlighted = &BBCBackgroundColorHighlighted;

@implementation UIButton (BBCBackgroundColor)

#pragma mark - BackgroundColor

- (void)bbc_backgroundColorNormal:(UIColor *)normal
          backgroundColorSelected:(UIColor *)selected
{
    [self bbc_backgroundColorNormal:normal
         backgroundColorHighlighted:selected];
}

- (void)bbc_backgroundColorNormal:(UIColor *)normal
       backgroundColorHighlighted:(UIColor *)highlighted
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
    [self setHighlightedBackgroundColor:highlighted];
}

#pragma mark - Setters

- (void)setNormalBackgroundColor:(UIColor *)normal
{
    objc_setAssociatedObject(self,
                             BBCBackgroundColorNormal,
                             normal,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setHighlightedBackgroundColor:(UIColor *)highlighted
{
    objc_setAssociatedObject(self,
                             BBCBackgroundColorHighlighted,
                             highlighted,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Getters

- (UIColor *)normalBackgroundColor
{
    return objc_getAssociatedObject(self,
                                    BBCBackgroundColorNormal);
}

- (UIColor *)highlightedBackgroundColor
{
    return objc_getAssociatedObject(self,
                                    BBCBackgroundColorHighlighted);
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
    sender.backgroundColor = self.highlightedBackgroundColor;
}

- (void)buttonTouchCancel:(UIButton *)sender
{
    sender.backgroundColor = self.normalBackgroundColor;
}

#pragma mark - ControlState

- (void)setHighlighted:(BOOL)highlighted
{
    super.highlighted = highlighted;
    
    if (highlighted)
    {
        self.backgroundColor = self.highlightedBackgroundColor;
    }
    else
    {
        self.backgroundColor = self.normalBackgroundColor;
    }
}

@end
