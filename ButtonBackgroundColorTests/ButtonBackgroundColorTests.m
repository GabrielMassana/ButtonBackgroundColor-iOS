//
//  ButtonBackgroundColorTests.m
//  ButtonBackgroundColorTests
//
//  Created by GabrielMassana on 04/03/2016.
//  Copyright © 2016 GabrielMassana. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "UIButton+BBCBackgroundColor.h"

@interface ButtonBackgroundColorTests : XCTestCase

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIButton *deprecatedButton;
@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *highlightedColor;

@end

@implementation ButtonBackgroundColorTests

- (void)setUp
{
    [super setUp];
    
    self.normalColor = [UIColor redColor];
    self.highlightedColor = [UIColor orangeColor];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.button bbc_backgroundColorNormal:self.normalColor
                backgroundColorHighlighted:self.highlightedColor];
    
    self.deprecatedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.deprecatedButton bbc_backgroundColorNormal:self.normalColor
                backgroundColorHighlighted:self.highlightedColor];
}

- (void)tearDown
{
    self.normalColor = nil;
    self.highlightedColor = nil;
    self.button = nil;
    self.deprecatedButton = nil;
    
    [super tearDown];
}

#pragma mark - Color

- (void)test_bbc_backgroundColor_setted
{
    XCTAssertEqualObjects(self.button.backgroundColor, self.normalColor,  @"fail_test_bbc_backgroundColor_setted");
}

- (void)test_bbc_normalColor_stored
{
    XCTAssertEqualObjects(self.button.normalBackgroundColor, self.normalColor,  @"fail_test_bbc_normalColor_stored");
}

- (void)test_bbc_highlightedColor_stored
{
    XCTAssertEqualObjects(self.button.highlightedBackgroundColor, self.highlightedColor,  @"fail_test_bbc_highlightedColor_stored");
}

#pragma mark - ColorDeprecated

- (void)test_bbc_backgroundColor_setted_deprecated
{
    XCTAssertEqualObjects(self.deprecatedButton.backgroundColor, self.normalColor,  @"fail_test_bbc_backgroundColor_setted_deprecated");
}

- (void)test_bbc_normalColor_stored_deprecated
{
    XCTAssertEqualObjects(self.deprecatedButton.normalBackgroundColor, self.normalColor,  @"fail_test_bbc_normalColor_stored_deprecated");
}

- (void)test_bbc_highlightedColor_stored_deprecated
{
    XCTAssertEqualObjects(self.deprecatedButton.highlightedBackgroundColor, self.highlightedColor,  @"fail_test_bbc_highlightedColor_stored_deprecated");
}

#pragma mark - ControlEvent

- (void)test_bbc_controlEventTouchDown
{
    [self.button sendActionsForControlEvents:UIControlEventTouchDown];
    
    XCTAssertEqualObjects(self.button.backgroundColor, self.highlightedColor,  @"fail_test_bbc_controlEventTouchDown");
}

- (void)test_bbc_controlEventTouchUpInside
{
    [self.button sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    XCTAssertEqualObjects(self.button.backgroundColor, self.normalColor,  @"fail_test_bbc_controlEventTouchUpInside");
}

- (void)test_bbc_controlEventTouchUpOutside
{
    [self.button sendActionsForControlEvents:UIControlEventTouchUpOutside];
    
    XCTAssertEqualObjects(self.button.backgroundColor, self.normalColor,  @"fail_test_bbc_controlEventTouchUpOutside");
}

- (void)test_bbc_controlEventTouchCancel
{
    [self.button sendActionsForControlEvents:UIControlEventTouchCancel];
    
    XCTAssertEqualObjects(self.button.backgroundColor, self.normalColor,  @"fail_test_bbc_controlEventTouchCancel");
}

#pragma mark - ControlEventDeprecated

- (void)test_bbc_controlEventTouchDown_deprecated
{
    [self.deprecatedButton sendActionsForControlEvents:UIControlEventTouchDown];
    
    XCTAssertEqualObjects(self.deprecatedButton.backgroundColor, self.highlightedColor,  @"fail_test_bbc_controlEventTouchDown_deprecated");
}

- (void)test_bbc_controlEventTouchUpInside_deprecated
{
    [self.button sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    XCTAssertEqualObjects(self.deprecatedButton.backgroundColor, self.normalColor,  @"fail_test_bbc_controlEventTouchUpInside_deprecated");
}

- (void)test_bbc_controlEventTouchUpOutside_deprecated
{
    [self.button sendActionsForControlEvents:UIControlEventTouchUpOutside];
    
    XCTAssertEqualObjects(self.deprecatedButton.backgroundColor, self.normalColor,  @"fail_test_bbc_controlEventTouchUpOutside_deprecated");
}

- (void)test_bbc_controlEventTouchCancel_deprecated
{
    [self.button sendActionsForControlEvents:UIControlEventTouchCancel];
    
    XCTAssertEqualObjects(self.deprecatedButton.backgroundColor, self.normalColor,  @"fail_test_bbc_controlEventTouchCancel_deprecated");
}

#pragma mark - ControlState

- (void)test_bbc_controlStateNormal
{
    XCTAssertEqualObjects(self.button.backgroundColor, self.normalColor,  @"fail_test_bbc_controlStateNormal");
}

- (void)test_bbc_controlStateHighlighted
{
    self.button.highlighted = YES;
    
    XCTAssertEqualObjects(self.button.backgroundColor, self.highlightedColor,  @"fail_test_bbc_controlStateHighlighted");
}

#pragma mark - ControlStateDeprecated

- (void)test_bbc_controlStateNormal_deprecated
{
    XCTAssertEqualObjects(self.deprecatedButton.backgroundColor, self.normalColor,  @"fail_test_bbc_controlStateNormal_deprecated");
}

- (void)test_bbc_controlStateHighlighted_deprecated
{
    self.deprecatedButton.highlighted = YES;
    
    XCTAssertEqualObjects(self.deprecatedButton.backgroundColor, self.highlightedColor,  @"fail_test_bbc_controlStateHighlighted_deprecated");
}

@end
