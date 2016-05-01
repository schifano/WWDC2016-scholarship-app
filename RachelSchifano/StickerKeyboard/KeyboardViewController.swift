//
//  KeyboardViewController.swift
//  StickerKeyboard
//
//  Created by Rachel Schifano on 5/1/16.
//  Copyright © 2016 schifano. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let nib = UINib(nibName: "KeyboardView", bundle: nil)
        let objects = nib.instantiateWithOwner(self, options: nil)
        view = objects[0] as! UIView;
        
        // Perform custom UI setup here
        
        self.nextKeyboardButton = UIButton(type: .System)
    
        self.nextKeyboardButton.setTitle(NSLocalizedString("KB", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
    
        self.nextKeyboardButton.addTarget(self, action: #selector(UIInputViewController.advanceToNextInputMode), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
    
        self.nextKeyboardButton.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor).active = true
        self.nextKeyboardButton.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor).active = true
    }
    
    
    @IBAction func bearStickerPressed(sender: UIButton) {
        let image = UIImage(named: "sticker-bear")
        UIPasteboard.generalPasteboard().image = image
    }
    
    @IBAction func burgerStickerPressed(sender: UIButton) {
        let image = UIImage(named: "sticker-burger")
        UIPasteboard.generalPasteboard().image = image
    }
    
    @IBAction func heartStickerPressed(sender: UIButton) {
        let image = UIImage(named: "sticker-heart")
        UIPasteboard.generalPasteboard().image = image
    }
    
    @IBAction func alsoStickerPressed(sender: UIButton) {
        let image = UIImage(named: "sticker-also")
        UIPasteboard.generalPasteboard().image = image
    }
    
    @IBAction func illinoisStickerPressed(sender: UIButton) {
        let image = UIImage(named: "sticker-illinois")
        UIPasteboard.generalPasteboard().image = image
    }
    
    @IBAction func flagStickerPressed(sender: UIButton) {
        let image = UIImage(named: "sticker-flag")
        UIPasteboard.generalPasteboard().image = image
    }
}
