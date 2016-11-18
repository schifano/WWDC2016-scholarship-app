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
    override var prefersStatusBarHidden : Bool {
        return false
    }
    
    // Buttons trigger segue, pass in the button type
    // Use switch statement to determine which button was pressed
    // Call in corresponding data
    
    // MARK: Actions for menu buttons
    @IBAction func aboutButtonTapped(_ sender: AnyObject) {
        buttonTapped = sender.currentTitle
        print(buttonTapped) // TEST prints out actual title successfully "ABOUT"
    }
    @IBAction func achievementsButtonTapped(_ sender: AnyObject) {
        buttonTapped = sender.currentTitle
        print(buttonTapped) // TEST
    }
    
    @IBAction func ambitionsButtonTapped(_ sender: AnyObject) {
        buttonTapped = sender.currentTitle
        print(buttonTapped) // TEST
    }
    
    @IBAction func appsButtonTapped(_ sender: AnyObject) {
        buttonTapped = sender.currentTitle
        print(buttonTapped) // TEST
    }
    
    @IBAction func unwindToHome(_ segue: UIStoryboardSegue) {
        
    }
    
    // Perform segue to SlideCollectionViewController
    // Pass selected button text
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let slideCollectionViewController = segue.destination as? SlideCollectionViewController {
            slideCollectionViewController.buttonSelected = buttonTapped
        }
    }
    
    
}
