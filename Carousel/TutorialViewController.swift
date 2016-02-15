//
//  TutorialViewController.swift
//  Carousel
//
//  Created by Zach Cole on 2/8/16.
//  Copyright © 2016 Zach Cole. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var takeCarouselButton: UIButton!
    @IBOutlet weak var button: UIImageView!
    @IBOutlet weak var switchView: UISwitch!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        scrollView.delegate = self
        button.alpha = 0
        takeCarouselButton.hidden = true
        switchView.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        pageControl.currentPage = page
        
        if page == 3 {
            pageControl.hidden = true
            takeCarouselButton.hidden = false
            switchView.hidden = false
            UIView.animateWithDuration(0.3) { () -> Void in
                self.button.alpha = 1
            }
        }
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
