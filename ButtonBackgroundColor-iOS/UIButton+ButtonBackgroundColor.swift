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
    public func backgroundColorForStates(normal normal: UIColor, highlighted: UIColor)
    {
        //set normal background color
        backgroundColor = normal

        //handle states
        addTarget(self, action: "buttonTouchUpInside:", forControlEvents:.TouchUpInside)
        addTarget(self, action: "buttonTouchUpOutside:", forControlEvents:.TouchUpOutside)
        addTarget(self, action: "buttonTouchDown:", forControlEvents:.TouchDown)
        addTarget(self, action: "buttonTouchCancel:", forControlEvents:.TouchCancel)
        
        //store colors
        objc_setAssociatedObject(self, &BackgroundColorNormal, normal, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        objc_setAssociatedObject(self, &BackgroundColorHighlighted, highlighted, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    //MARK: Getters
    
    /// The color for a normal state.
    private func normalBackgroundColor() -> UIColor?
    {
        return objc_getAssociatedObject(self, &BackgroundColorNormal) as? UIColor
    }
    /// The color for a highlighted state.
    private func highlightedBackgroundColor() -> UIColor?
    {
        return objc_getAssociatedObject(self, &BackgroundColorHighlighted) as? UIColor
    }

    //MARK: ButtonActions
    
    func buttonTouchUpInside(sender: UIButton)
    {
        sender.backgroundColor = normalBackgroundColor()
    }
    
    func buttonTouchUpOutside(sender: UIButton)
    {
        sender.backgroundColor = normalBackgroundColor()
    }
    
    func buttonTouchDown(sender: UIButton)
    {
        sender.backgroundColor = highlightedBackgroundColor()
    }
    
    func buttonTouchCancel(sender: UIButton)
    {
        sender.backgroundColor = normalBackgroundColor()
    }

    //MARK: ControlState
    
    override var highlighted: Bool
    {
        didSet
        {
            if (highlighted == true &&
            highlightedBackgroundColor() != nil)
            {
                backgroundColor = self.highlightedBackgroundColor()
            }
            else if (self.normalBackgroundColor() != nil)
            {
                backgroundColor = self.normalBackgroundColor()
            }
        }
    }
}