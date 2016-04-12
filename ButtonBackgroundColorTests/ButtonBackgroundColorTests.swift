//
//  ButtonBackgroundColorTests.swift
//  ButtonBackgroundColorTests
//
//  Created by GabrielMassana on 12/04/2016.
//  Copyright © 2016 GabrielMassana. All rights reserved.
//

import XCTest

@testable import ButtonBackgroundColor

class ButtonBackgroundColorTests: XCTestCase {
    
    //MARK: - Accessors

    var button: UIButton?
    var buttonWithoutExtension: UIButton?
    
    var normalColor: UIColor?
    var highlightedColor: UIColor?
    
    //MARK: - SetUp

    override func setUp()
    {
        super.setUp()
        
        normalColor = UIColor.redColor()
        highlightedColor = UIColor.orangeColor()
    
        button = UIButton(type: .Custom)
        
        button!.backgroundColorForStates(normal: normalColor!, highlighted: highlightedColor!)
        
        buttonWithoutExtension = UIButton(type: .Custom)
        
        buttonWithoutExtension!.backgroundColor = normalColor
    }
    
    override func tearDown()
    {
        self.normalColor = nil;
        self.highlightedColor = nil;
        
        self.button = nil;
        self.buttonWithoutExtension = nil;
        
        super.tearDown()
    }
    
    //MARK: - Color

    func test_bbc_backgroundColor_setted()
    {
        XCTAssertEqual(button!.backgroundColor, normalColor,  "fail_test_bbc_backgroundColor_setted");
    }
    
    func test_bbc_normalColor_stored()
    {
        XCTAssertEqual(button!.normalBackgroundColor(), normalColor,  "fail_test_bbc_normalColor_stored");
    }
    
    func test_bbc_highlightedColor_stored()
    {
        XCTAssertEqual(button!.highlightedBackgroundColor(), highlightedColor,  "fail_test_bbc_highlightedColor_stored");
    }
    
    //MARK: - ColorWithoutExtension

    func test_bbc_backgroundColor_setted_withoutExtension()
    {
        XCTAssertEqual(buttonWithoutExtension!.backgroundColor, normalColor,  "fail_test_bbc_backgroundColor_setted_withoutExtension");
    }
    
    func test_bbc_normalColor_stored_withoutExtension()
    {
        XCTAssertEqual(buttonWithoutExtension!.normalBackgroundColor(), nil,  "fail_test_bbc_normalColor_stored_withoutExtension");
    }
    
    func test_bbc_highlightedColor_stored_withoutExtension()
    {
        XCTAssertEqual(buttonWithoutExtension!.highlightedBackgroundColor(), nil,  "fail_test_bbc_highlightedColor_stored_withoutExtension");
    }
    
    //MARK: - ControlEvent
    
    func test_bbc_controlEventTouchDown()
    {
        button!.sendActionsForControlEvents(.TouchDown)
        
        XCTAssertEqual(button!.backgroundColor, highlightedColor,  "fail_test_bbc_controlEventTouchDown");
    }
    
    func test_bbc_controlEventTouchUpInside()
    {
        button!.sendActionsForControlEvents(.TouchUpInside)
        
        XCTAssertEqual(button!.backgroundColor, normalColor,  "test_bbc_controlEventTouchUpInside");
    }
    
    func test_bbc_controlEventTouchUpOutside()
    {
        button!.sendActionsForControlEvents(.TouchUpOutside)
        
        XCTAssertEqual(button!.backgroundColor, normalColor,  "test_bbc_controlEventTouchUpOutside");
    }
    
    func test_bbc_controlEventTouchCancel()
    {
        button!.sendActionsForControlEvents(.TouchCancel)
        
        XCTAssertEqual(button!.backgroundColor, normalColor,  "test_bbc_controlEventTouchCancel");
    }
    
    //MARK: - ControlEventWithoutExtension
    
    func test_bbc_controlEventTouchDown_withoutExtension()
    {
        buttonWithoutExtension!.sendActionsForControlEvents(.TouchDown)
        
        XCTAssertEqual(button!.backgroundColor, normalColor,  "test_bbc_controlEventTouchDown_withoutExtension");
    }
    
    func test_bbc_controlEventTouchUpInside_withoutExtension()
    {
        buttonWithoutExtension!.sendActionsForControlEvents(.TouchUpInside)
        
        XCTAssertEqual(button!.backgroundColor, normalColor,  "test_bbc_controlEventTouchUpInside_withoutExtension");
    }
    
    func test_bbc_controlEventTouchUpOutside_withoutExtension()
    {
        buttonWithoutExtension!.sendActionsForControlEvents(.TouchUpOutside)
        
        XCTAssertEqual(button!.backgroundColor, normalColor,  "test_bbc_controlEventTouchUpOutside_withoutExtension");
    }
    
    func test_bbc_controlEventTouchCancel_withoutExtension()
    {
        buttonWithoutExtension!.sendActionsForControlEvents(.TouchCancel)
        
        XCTAssertEqual(button!.backgroundColor, normalColor,  "test_bbc_controlEventTouchCancel_withoutExtension");
    }
    
    //MARK: - ControlState

    func test_bbc_controlStateNormal()
    {
        XCTAssertEqual(button!.backgroundColor, normalColor,  "fail_test_bbc_controlStateNormal");
    }
    
    func test_bbc_controlStateHighlighted()
    {
        button!.highlighted = true;
        
        XCTAssertEqual(button!.backgroundColor, highlightedColor,  "fail_test_bbc_controlStateHighlighted");
    }
    
    //MARK: - ControlStateWithoutExtension
    
    func test_bbc_controlStateNormal_withoutExtension()
    {
        XCTAssertEqual(buttonWithoutExtension!.backgroundColor, normalColor,  "test_bbc_controlStateNormal_withoutExtension");
    }
    
    func test_bbc_controlStateHighlighted_withoutExtension()
    {
        buttonWithoutExtension!.highlighted = true;
        
        XCTAssertEqual(buttonWithoutExtension!.backgroundColor, normalColor,  "test_bbc_controlStateHighlighted_withoutExtension");
    }
}
