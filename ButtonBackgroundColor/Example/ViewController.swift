//
//  ViewController.swift
//  ButtonBackgroundColor
//
//  Created by GabrielMassana on 12/04/2016.
//  Copyright © 2016 GabrielMassana. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let button: UIButton = UIButton(type: .Custom)
        
        button.frame = CGRectMake(0.0, 100.0, CGRectGetWidth(UIScreen.mainScreen().bounds), 80.0)
        button.backgroundColorForStates(normal: UIColor.redColor(), highlighted: UIColor.blueColor())
        
        view.addSubview(button)
        
        let buttonWithout: UIButton = UIButton(type: .Custom)
        
        buttonWithout.frame = CGRectMake(0.0, 200.0, CGRectGetWidth(UIScreen.mainScreen().bounds), 80.0)
        buttonWithout.backgroundColor = UIColor.greenColor()
        
        view.addSubview(buttonWithout)
    }
}

