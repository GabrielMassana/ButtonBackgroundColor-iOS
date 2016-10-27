//
//  UIButton+ButtonBackgroundColor.swift
//  ButtonBackgroundColor
//
//  Created by GabrielMassana on 12/04/2016.
//  Copyright © 2016 GabrielMassana. All rights reserved.
//

import UIKit
import ObjectiveC

/// Key for a normal backgroundColor.
var BackgroundColorNormal = "BackgroundColorNormal"

/// Key for a highlighted backgroundColor.
var BackgroundColorHighlighted = "BackgroundColorHighlighted"

/// Extension to handle the background color of a UIButton in normal and highlighted state.
public extension UIButton
{
    //MARK: ButtonBackgroundColor
    
    /**
     Sets the background colors to use in normal and highlighted button state.
     
     - parameter normal: the color for a normal state.
     - parameter highlighted: the color for a highlighted state.
     */
    @objc(bbc_backgroundColorNormal:backgroundColorHighlighted:)
    public func backgroundColorForStates(normal: UIColor, highlighted: UIColor)
    {
        //set normal background color
        backgroundColor = normal

        //handle states
        addTarget(self, action:#selector(UIButton.buttonTouchUpInside(_:)), for:.touchUpInside)
        addTarget(self, action:#selector(UIButton.buttonTouchUpOutside(_:)), for:.touchUpOutside)
        addTarget(self, action:#selector(UIButton.buttonTouchDown(_:)), for:.touchDown)
        addTarget(self, action:#selector(UIButton.buttonTouchCancel(_:)), for:.touchCancel)
        
        //store colors
        objc_setAssociatedObject(self, &BackgroundColorNormal, normal, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        objc_setAssociatedObject(self, &BackgroundColorHighlighted, highlighted, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    //MARK: Getters
    
    /**
     The color for a normal state.
    
     returns: The normal background color
    */
    public func normalBackgroundColor() -> UIColor?
    {
        return objc_getAssociatedObject(self, &BackgroundColorNormal) as? UIColor
    }
    
    /**
    The color for a highlighted state.
    
    returns: The highlighted background color.
     */
    public func highlightedBackgroundColor() -> UIColor?
    {
        return objc_getAssociatedObject(self, &BackgroundColorHighlighted) as? UIColor
    }

    //MARK: ButtonActions
    
    /**
     The button updates the background color after a Control Event TouchUpInside.
     
     - parameter sender: the button.
     */
    func buttonTouchUpInside(_ sender: UIButton)
    {
        sender.backgroundColor = normalBackgroundColor()
    }
    
    /**
     The button updates the background color after a Control Event TouchUpOutside.
     
     - parameter sender: the button.
     */
    func buttonTouchUpOutside(_ sender: UIButton)
    {
        sender.backgroundColor = normalBackgroundColor()
    }
    
    /**
     The button updates the background color after a Control Event TouchDown.
     
     - parameter sender: the button.
     */
    func buttonTouchDown(_ sender: UIButton)
    {
        sender.backgroundColor = highlightedBackgroundColor()
    }
    
    /**
     The button updates the background color after a Control Event TouchCancel.
     
     - parameter sender: the button.
     */
    func buttonTouchCancel(_ sender: UIButton)
    {
        sender.backgroundColor = normalBackgroundColor()
    }
}
