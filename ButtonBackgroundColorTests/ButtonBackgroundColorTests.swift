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
        
        normalColor = UIColor.red
        highlightedColor = UIColor.orange
    
        button = UIButton(type: .custom)
        
        button!.backgroundColorForStates(normal: normalColor!, highlighted: highlightedColor!)
        
        buttonWithoutExtension = UIButton(type: .custom)
        
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
        button!.sendActions(for: .touchDown)
        
        XCTAssertEqual(button!.backgroundColor, highlightedColor,  "fail_test_bbc_controlEventTouchDown");
    }
    
    func test_bbc_controlEventTouchUpInside()
    {
        button!.sendActions(for: .touchUpInside)
        
        XCTAssertEqual(button!.backgroundColor, normalColor,  "test_bbc_controlEventTouchUpInside");
    }
    
    func test_bbc_controlEventTouchUpOutside()
    {
        button!.sendActions(for: .touchUpOutside)
        
        XCTAssertEqual(button!.backgroundColor, normalColor,  "test_bbc_controlEventTouchUpOutside");
    }
    
    func test_bbc_controlEventTouchCancel()
    {
        button!.sendActions(for: .touchCancel)
        
        XCTAssertEqual(button!.backgroundColor, normalColor,  "test_bbc_controlEventTouchCancel");
    }
    
    //MARK: - ControlEventWithoutExtension
    
    func test_bbc_controlEventTouchDown_withoutExtension()
    {
        buttonWithoutExtension!.sendActions(for: .touchDown)
        
        XCTAssertEqual(button!.backgroundColor, normalColor,  "test_bbc_controlEventTouchDown_withoutExtension");
    }
    
    func test_bbc_controlEventTouchUpInside_withoutExtension()
    {
        buttonWithoutExtension!.sendActions(for: .touchUpInside)
        
        XCTAssertEqual(button!.backgroundColor, normalColor,  "test_bbc_controlEventTouchUpInside_withoutExtension");
    }
    
    func test_bbc_controlEventTouchUpOutside_withoutExtension()
    {
        buttonWithoutExtension!.sendActions(for: .touchUpOutside)
        
        XCTAssertEqual(button!.backgroundColor, normalColor,  "test_bbc_controlEventTouchUpOutside_withoutExtension");
    }
    
    func test_bbc_controlEventTouchCancel_withoutExtension()
    {
        buttonWithoutExtension!.sendActions(for: .touchCancel)
        
        XCTAssertEqual(button!.backgroundColor, normalColor,  "test_bbc_controlEventTouchCancel_withoutExtension");
    }
}
