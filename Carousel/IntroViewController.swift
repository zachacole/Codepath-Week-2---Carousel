//
//  IntroViewController.swift
//  Carousel
//
//  Created by Zach Cole on 2/8/16.
//  Copyright © 2016 Zach Cole. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tileOne: UIImageView!
    @IBOutlet weak var tileTwo: UIImageView!
    @IBOutlet weak var tileThree: UIImageView!
    @IBOutlet weak var tileFour: UIImageView!
    @IBOutlet weak var tileFive: UIImageView!
    @IBOutlet weak var tileSix: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.delegate = self
        
        scrollView.contentSize = CGSize(width: 320, height: 1136)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let scrollOffset = scrollView.contentOffset.y
        
        tileOne.transform = CGAffineTransformMakeTranslation(scrollOffset/14.9473, scrollOffset/1.5966)
        
        tileTwo.transform = CGAffineTransformMakeTranslation(scrollOffset/2.6919, scrollOffset/1.5106)
        
        tileThree.transform = CGAffineTransformMakeTranslation(scrollOffset/10.5185, scrollOffset/1.4715)
        
        tileFour.transform = CGAffineTransformMakeTranslation(scrollOffset/(-9.7931), scrollOffset/1.1203)
        
        tileFive.transform = CGAffineTransformMakeTranslation(scrollOffset/(-4.618), scrollOffset/1.086)
        
        tileSix.transform = CGAffineTransformMakeTranslation(scrollOffset/(-6.4545), scrollOffset/1.2456)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
