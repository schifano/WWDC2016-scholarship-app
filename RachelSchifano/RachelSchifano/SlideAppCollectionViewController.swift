//
//  SlideAppCollectionViewController.swift
//  RachelSchifano
//
//  Created by Rachel Schifano on 5/1/16.
//  Copyright © 2016 schifano. All rights reserved.
//

import Foundation
import UIKit

class SlideAppCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var flowLayout: SlideCollectionViewFlowLayout!
    // FIXME: Refactor to remove redundant code
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set dimension of collection view cells to be size of screen
        flowLayout.itemSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        // FIXME: Temporary fix for the cell gap issue
        flowLayout.minimumLineSpacing = 0
        
        // Implement swipe gesture
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(SlideAppCollectionViewController.handleDownSwipe(_:)))
        downSwipe.direction = .down
        view.addGestureRecognizer(downSwipe)
    }
    
    // TODO: Implement unwind segue
    func handleDownSwipe(_ sender: UISwipeGestureRecognizer) {
        print("Swiped down") // TEST
        performSegue(withIdentifier: "unwindToHome", sender: nil)
    }
    
    // TODO: Hide the status bar
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    // MARK: Collection View Data Source
    /**
         Asks the data source for the number of items in the specified section. (required)
         
         - parameter collectionView: An object representing the collection view requesting this information.
         - parameter section: An index number identifying a section in collectionView.
         - returns: memes.count The number of rows (memes) in section
     */
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hardCodedAppsData().count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SlideAppCollectionViewCell", for: indexPath) as! SlideAppCollectionViewCell
        
        // Load data corresponding to button tapped
        var app = [String: AnyObject]()
        app = hardCodedAppsData()[indexPath.row]

        // Set image
        let appImageName = app["image"] as! String
        let appImage = UIImage.init(named: appImageName)
        cell.appImageView.image = appImage
        // Set title
        cell.appTitleText.text = app["title"] as? String
        // Set description
        cell.appDescriptionText.text = app["description"] as? String
        
        return cell
    }
    
    // FIXME: Add information about apps
    func hardCodedAppsData() ->[[String: AnyObject]] {
        return [
            [
                "image": "25-meme" as AnyObject,
                "title": "MEME ME" as AnyObject,
                "description": "Table and Collection View. Take or load a photo. Create and edit memes. Save or send memes to friends." as AnyObject
            ], [
                "image": "26-pitch" as AnyObject,
                "title": "PITCH PERFECT" as AnyObject,
                "description": "Record audio. Effects: Chipmunk, Vader, Slow, Fast, Reverb, Echo. Accessibility enabled." as AnyObject
            ], [
                "image": "27-maps" as AnyObject,
                "title": "ON THE MAP",
                "description": "Load map of Udacity students. Add your location and website. Parse."
            ], [
                "image": "28-childreninternational",
                "title": "NEWSFEED",
                "description": "Children International news feed. Stay updated with your sponsored child. Parse."
            ], [
                "image": "29-other",
                "title": "OTHER APPS",
                "description": "Numerous other iOS sample and work apps. Notably: face/rectangle detection, cameras, CoreImage/OpenGL."
            ]
        ]
    }
}
