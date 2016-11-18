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
        let objects = nib.instantiate(withOwner: self, options: nil)
        view = objects[0] as! UIView;
        
        // Perform custom UI setup here
        
        self.nextKeyboardButton = UIButton(type: .system)
    
        self.nextKeyboardButton.setTitle(NSLocalizedString("KB", comment: "Title for 'Next Keyboard' button"), for: UIControlState())
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
    
        self.nextKeyboardButton.addTarget(self, action: #selector(UIInputViewController.advanceToNextInputMode), for: .touchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
    
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    
    @IBAction func bearStickerPressed(_ sender: UIButton) {
        let image = UIImage(named: "sticker-bear")
        UIPasteboard.general.image = image
    }
    
    @IBAction func burgerStickerPressed(_ sender: UIButton) {
        let image = UIImage(named: "sticker-burger")
        UIPasteboard.general.image = image
    }
    
    @IBAction func heartStickerPressed(_ sender: UIButton) {
        let image = UIImage(named: "sticker-heart")
        UIPasteboard.general.image = image
    }
    
    @IBAction func alsoStickerPressed(_ sender: UIButton) {
        let image = UIImage(named: "sticker-also")
        UIPasteboard.general.image = image
    }
    
    @IBAction func illinoisStickerPressed(_ sender: UIButton) {
        let image = UIImage(named: "sticker-illinois")
        UIPasteboard.general.image = image
    }
    
    @IBAction func flagStickerPressed(_ sender: UIButton) {
        let image = UIImage(named: "sticker-flag")
        UIPasteboard.general.image = image
    }
}
