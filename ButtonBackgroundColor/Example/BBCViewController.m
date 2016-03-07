//
//  ViewController.m
//  ButtonBackgroundColor
//
//  Created by GabrielMassana on 21/01/2016.
//  Copyright © 2016 GabrielMassana. All rights reserved.
//

#import "BBCViewController.h"

#import "UIButton+BBCBackgroundColor.h"

@interface BBCViewController ()

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) UIButton *buttonWithout;

@end

@implementation BBCViewController

#pragma mark - ViewLifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.button];
    [self.view addSubview:self.buttonWithout];
}

#pragma mark - Subviews

- (UIButton *)button
{
    if (!_button)
    {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(0.0f,
                                   100.0f,
                                   CGRectGetWidth([UIScreen mainScreen].bounds),
                                   80.0f);
        
        [_button bbc_backgroundColorNormal:[UIColor redColor]
                backgroundColorHighlighted:[UIColor blueColor]];
    }
    
    return _button;
}

- (UIButton *)buttonWithout
{
    if (!_buttonWithout)
    {
        _buttonWithout = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonWithout.frame = CGRectMake(0.0f,
                                   200.0f,
                                   CGRectGetWidth([UIScreen mainScreen].bounds),
                                   80.0f);
        
        _buttonWithout.backgroundColor = [UIColor blueColor];
    }
    
    return _buttonWithout;
}

@end
