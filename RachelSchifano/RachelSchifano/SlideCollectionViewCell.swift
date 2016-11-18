//
//  SlideCollectionViewCell.swift
//  RachelSchifano
//
//  Created by Rachel Schifano on 4/30/16.
//  Copyright © 2016 schifano. All rights reserved.
//

import Foundation
import UIKit

class SlideCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideHashtagText: UILabel!
    @IBOutlet weak var slideTitleText: UILabel!
    @IBOutlet weak var slideDescriptionText: UILabel!
 
    // MARK: Parallax cell
    @IBOutlet weak var parallaxHeightConstraint: NSLayoutConstraint!
//    @IBOutlet weak var parallaxTopConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clipsToBounds = true
        slideImageView.contentMode = .scaleAspectFill
        slideImageView.clipsToBounds = false
    }
}
