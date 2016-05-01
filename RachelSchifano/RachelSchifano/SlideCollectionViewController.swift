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
    @IBOutlet weak var slideCollectionView: UICollectionView!
    
    var buttonSelected: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Implement swipe gesture
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(SlideCollectionViewController.handleDownSwipe(_:)))
        downSwipe.direction = .Down
        view.addGestureRecognizer(downSwipe)
        
        // FIXME: Add minimumLineSpacing gap for design
        // Set dimension of collection view cells to be size of screen
        flowLayout.itemSize = CGSizeMake(self.view.frame.width, self.view.frame.height)
        // FIXME: Temporary fix for the cell gap issue
        flowLayout.minimumLineSpacing = 0
    }
    
    // TODO: Implement unwind segue
    func handleDownSwipe(sender: UISwipeGestureRecognizer) {
        print("Swiped down") // TEST
        performSegueWithIdentifier("unwindToHome", sender: nil)
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
        var numberOfItems: Int!
        switch buttonSelected {
            case "ABOUT":
                numberOfItems = hardCodedAboutData().count
            case "ACHIEVEMENTS":
                numberOfItems = hardCodedAchievementsData().count
            case "AMBITIONS":
                numberOfItems = hardCodedAmbitionsData().count
            default:
                break
        }
        return numberOfItems
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SlideCollectionViewCell", forIndexPath: indexPath) as! SlideCollectionViewCell
        
        // Load data corresponding to button tapped
        var slide = [String: AnyObject]()
        switch buttonSelected {
            case "ABOUT":
                slide = hardCodedAboutData()[indexPath.row]
            case "ACHIEVEMENTS":
                slide = hardCodedAchievementsData()[indexPath.row]
            case "AMBITIONS":
                slide = hardCodedAmbitionsData()[indexPath.row]
            default:
                break
        }
        
        // Set image
        let slideImageName = slide["image"] as! String
        let slideImage = UIImage.init(named: slideImageName)
        cell.slideImageView.image = slideImage
        
        cell.parallaxHeightConstraint.constant = parallaxImageHeight
//        cell.parallaxTopConstraint.constant = parallaxOffsetFor(slideCollectionView.contentOffset.y, cell: cell)
        
        // Set hashtag
        cell.slideHashtagText.text = slide["hashtag"] as? String
        // Set title
        cell.slideTitleText.text = slide["title"] as? String
        // Set description
        cell.slideDescriptionText.text = slide["description"] as? String
        
        return cell
    }
    
    // Change the ratio or enter a fixed value
    var cellHeight: CGFloat {
        return slideCollectionView.frame.width * 9/16
    }
    
    // An alias to make the code easier to read
    var imageVisibleHeight: CGFloat {
        return cellHeight
    }
    
    // Sets how fast the image moves when you scroll
    let parallaxOffsetSpeed: CGFloat = 25
    
    var parallaxImageHeight: CGFloat {
        let maxOffset = (sqrt(pow(cellHeight, 2) + 4 * parallaxOffsetSpeed * slideCollectionView.frame.height) - cellHeight) / 2
        return imageVisibleHeight + maxOffset
    }
    
    
    // Used when the table dequeues a cell, or when it scrolls
    func parallaxOffsetFor(newOffsetY: CGFloat, cell: UICollectionViewCell) -> CGFloat {
        return ((newOffsetY - cell.frame.origin.y) / parallaxImageHeight) * parallaxOffsetSpeed
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = slideCollectionView.contentOffset.y
        for cell in slideCollectionView.visibleCells() as! [SlideCollectionViewCell] {
//            cell.parallaxTopConstraint.constant = parallaxOffsetFor(offsetY, cell: cell)
        }
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
                "description": "Not afraid of blank canvases, oils, or crayons."
            ], [
                "image": "7-guitarist",
                "hashtag": "#Musician",
                "title": "METAL",
                "description": "Lover and listener. Lead metal guitarist."
            ]
        ]
    }
    
    func hardCodedAchievementsData() ->[[String: AnyObject]] {
        return [
            [
                "image": "9-niaf",
                "hashtag": "#NIAF",
                "title": "HERITAGE",
                "description": "National Italian American Foundation scholarship winner. 10-day trip. 500 applicants."
            ], [
                "image": "10-redbirdhacks",
                "hashtag": "#RedbirdHacks",
                "title": "DIRECTOR",
                "description": "Founded. Raised $16,000. First hackathon at Illinois State."
            ], [
                "image": "11-square",
                "hashtag": "#Square",
                "title": "CODE CAMPER",
                "description": "5-day engineering program. SF. 600 applicants. Jack Dorsey, machine learning, hacking."
            ], [
                "image": "12-hackcon",
                "hashtag": "#Hackcon",
                "title": "ORGANIZER",
                "description": "Hackathon organizer conference. Hackcon II (New York) & III (San Francisco)."
            ], [
                "image": "13-hackathons",
                "hashtag": "#Hackathons",
                "title": "STREET CRED",
                "description": "State Farm Hack Day 2014 Winner ($10,000). Participated in 8 hackathons."
            ], [
                "image": "14-gracehopper",
                "hashtag": "#GraceHopper",
                "title": "ACTIVIST",
                "description": "Advocate for diversity and inclusion. Selfishly hardworking, selflessly helpful."
            ], [
                "image": "15-womentech",
                "hashtag": "#GoogleChicago",
                "title": "TECHMAKER",
                "description": "Women techmaker, International Women's Day Summit. Fangirled over Parisa Tabriz."
            ], [
                "image": "16-ferrari",
                "hashtag": "#Ferrari458Italia",
                "title": "RACING",
                "description": "Drove a Ferrari 458 Italia using a wet driving line on a rainy day. Didn't even cry."
            ]
        ]
    }
    
    func hardCodedAmbitionsData() ->[[String: AnyObject]] {
        return [
            [
                "image": "17-wheel",
                "hashtag": "#Engineering",
                "title": "MY PASSION",
                "description": "Any intersection of engineering. I have to dissect it and learn it. Even Disneyland."
            ], [
                "image": "18-bridge",
                "hashtag": "#BayArea",
                "title": "MY FUTURE",
                "description": "Building apps to gain XP and level up. A challenging career change motivates me."
            ], [
                "image": "19-automechanics",
                "hashtag": "#Automechanics",
                "title": "MY CRAVING",
                "description": "Learning is the first step. Being a mechanic is the next. Racing is the culmination."
            ], [
                "image": "20-ios",
                "hashtag": "#Development",
                "title": "MY NICHE",
                "description": "I once wielded pencils. I now wield Swift. iOS is the code craft I want to master."
            ], [
                "image": "21-plane",
                "hashtag": "#Flying",
                "title": "MY CURIOSITY",
                "description": "Multitasking and planning. A necessity of disciplines. This is detail I admire."
            ], [
                "image": "22-controller",
                "hashtag": "#DJing",
                "title": "MY DECKS",
                "description": "The lights are impressive. The audio and hardware engineering even more."
            ], [
                "image": "23-guitars",
                "hashtag": "#Production",
                "title": "MY JAM",
                "description": "Ableton, guitar riffs, mixes, keyboard, theory. I'm no stranger to music."
            ], [
                "image": "24-burgers",
                "hashtag": "#Cheeseburgers",
                "title": "MY FAVES",
                "description": "Steak n' Shake fan. Not sold on In-N-Out. Still trying."
            ]
        ]
    }
}