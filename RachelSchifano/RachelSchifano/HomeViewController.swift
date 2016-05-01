//
//  HomeViewController.swift
//  RachelSchifano
//
//  Created by Rachel Schifano on 4/26/16.
//  Copyright © 2016 schifano. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
 
    var buttonTapped: String!
    
    // Perform segue and pass in the button that was tapped
    // Button tapped specifies the data that is loaded
    
    
    // TODO: Unhide status bar?
    // FIXME: Hiding status bar causes a glitch adjustment bc of constraints
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    // Buttons trigger segue, pass in the button type
    // Use switch statement to determine which button was pressed
    // Call in corresponding data
    
    // MARK: Actions for menu buttons
    @IBAction func aboutButtonTapped(sender: AnyObject) {
        buttonTapped = sender.currentTitle
        print(buttonTapped) // TEST prints out actual title successfully "ABOUT"
    }
    @IBAction func achievementsButtonTapped(sender: AnyObject) {
        buttonTapped = sender.currentTitle
        print(buttonTapped) // TEST
    }
    
    @IBAction func ambitionsButtonTapped(sender: AnyObject) {
        buttonTapped = sender.currentTitle
        print(buttonTapped) // TEST
    }
    
    @IBAction func appsButtonTapped(sender: AnyObject) {
        buttonTapped = sender.currentTitle
        print(buttonTapped) // TEST
    }
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        
    }
    
    // Perform segue to SlideCollectionViewController
    // Pass selected button text
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let slideCollectionViewController = segue.destinationViewController as? SlideCollectionViewController {
            slideCollectionViewController.buttonSelected = buttonTapped
        }
    }
    
    
}