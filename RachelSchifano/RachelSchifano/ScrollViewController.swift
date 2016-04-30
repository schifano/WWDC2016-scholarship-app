//
//  ViewController.swift
//  RachelSchifano
//
//  Created by Rachel Schifano on 4/22/16.
//  Copyright © 2016 schifano. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        scrollView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height) // set it to the size you want
        let scrollViewWidth: CGFloat = scrollView.frame.width
        let scrollViewHeight: CGFloat = scrollView.frame.height
        
        // 2
        textView.textAlignment = .Center
        textView.text = "Rachel is pretty awesome"
        textView.textColor = .blackColor()
        
        // 3
        let imageOne = UIImageView(frame: CGRectMake(0, 0, scrollViewWidth, scrollViewHeight))
        imageOne.image = UIImage(named: "Slide1")
        
        let imageTwo = UIImageView(frame:CGRectMake(scrollViewWidth, 0, scrollViewWidth, scrollViewHeight))
        imageTwo.image = UIImage(named: "Slide2")
        let imageThree = UIImageView(frame: CGRectMake(scrollViewWidth*2, 0, scrollViewWidth, scrollViewHeight))
        imageThree.image = UIImage(named: "Slide3")
        let imageFour = UIImageView(frame: CGRectMake(scrollViewWidth*3, 0, scrollViewWidth, scrollViewHeight))
        imageFour.image = UIImage(named: "Slide4")
        
        // 4
        scrollView.contentSize = CGSizeMake(scrollView.frame.width*4, scrollView.frame.height)
        scrollView.delegate = self
        pageControl.currentPage = 0
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth: CGFloat = CGRectGetWidth(scrollView.frame)
        let currentPage: CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        
        // Change the indicator
        pageControl.currentPage = Int(currentPage)
        
        // Change the text accordingly
        if Int(currentPage) == 0 {
            textView.text = "Welcome to my life"
        } else if Int(currentPage) == 1 {
            textView.text = "WHERE I'M FROM"
        } else if Int(currentPage) == 2 {
            textView.text = "MY IDEAL LIFE IN 10 YEARS"
        } else {
            textView.text = "ART = FASHION"
        }
    }
}

