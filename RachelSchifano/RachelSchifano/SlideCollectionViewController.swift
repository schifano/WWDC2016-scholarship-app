//
//  SlideCollectionViewController.swift
//  RachelSchifano
//
//  Created by Rachel Schifano on 4/28/16.
//  Copyright © 2016 schifano. All rights reserved.
//

import Foundation
import UIKit

class SlideCollectionViewController: UICollectionViewController {

    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    // TODO: Implement paging
    
    override func viewDidLoad() {

 
        // Set dimension of collection view cells to be size of screen
        flowLayout.itemSize = CGSizeMake(self.view.frame.width, self.view.frame.height)
        // FIXME: Temporary fix for the cell gap issue
        flowLayout.minimumLineSpacing = 0
    }
    
    // TODO: Hide the status bar
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    
    // MARK: Collection View Data Source
    /**
         Asks the data source for the number of items in the specified section. (required)
         
         - parameter collectionView: An object representing the collection view requesting this information.
         - parameter section: An index number identifying a section in collectionView.
         - returns: memes.count The number of rows (memes) in section
     */
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hardCodedAboutData().count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SlideCollectionViewCell", forIndexPath: indexPath) as! SlideCollectionViewCell
        // Access each slide object
        let slide = hardCodedAboutData()[indexPath.row]
        
        // Set image
        let slideImageName = slide["image"] as! String
        let slideImage = UIImage.init(named: slideImageName)
        cell.slideImageView.image = slideImage
        // Set hashtag
        cell.slideHashtagText.text = slide["hashtag"] as? String
        // Set title
        cell.slideTitleText.text = slide["title"] as? String
        // Set description
        cell.slideDescriptionText.text = slide["description"] as? String
        
        return cell
    }
    
    
    // MARK: Hardcoded data for now
    func hardCodedAboutData() ->[[String: AnyObject]] {
        return [
            [
                "image": "1-italipino",
                "hashtag": "#Italipino",
                "title": "SYNTHESIZER",
                "description": "Genetically and by craft."
            ], [
                "image": "2-throwback",
                "hashtag": "#MarioEarlyYears",
                "title": "THROWBACK",
                "description": "The real start to my CS career."
            ], [
                "image": "3-goodneighbear",
                "hashtag": "#GoodNeighbear",
                "title": "TEDDY BEARS",
                "description": "On a plane, on a train. My best travel buddies."
            ], [
                "image": "4-midwest",
                "hashtag": "#Midwest",
                "title": "MIDWEST VIBES",
                "description": "Where nothingness is beauty."
            ], [
                "image": "5-illinoisstate",
                "hashtag": "#IllinoisState",
                "title": "HARDLY NORMAL",
                "description": "Transfer student. Paid my own way. Succeeded."
            ], [
                "image": "6-artist",
                "hashtag": "#Artist",
                "title": "LIFE SKILL",
                "description": "Not afraid of oils, blank canvases or crayons."
            ], [
                "image": "7-guitarist",
                "hashtag": "#Musician",
                "title": "METAL",
                "description": "Lover, listener, and lead guitarist of metal."
            ]
        ]
    }
    
}