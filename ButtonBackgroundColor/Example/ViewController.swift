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

        let button: UIButton = UIButton(type: .custom)
        
        button.frame = CGRect(x: 0.0, y: 100.0, width: UIScreen.main.bounds.width, height: 80.0)
        button.backgroundColorForStates(normal: UIColor.red, highlighted: UIColor.blue)
        
        view.addSubview(button)
        
        let buttonWithout: UIButton = UIButton(type: .custom)
        
        buttonWithout.frame = CGRect(x: 0.0, y: 200.0, width: UIScreen.main.bounds.width, height: 80.0)
        buttonWithout.backgroundColor = UIColor.green
        
        view.addSubview(buttonWithout)
    }
}

