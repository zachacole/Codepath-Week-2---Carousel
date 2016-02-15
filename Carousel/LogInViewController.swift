//
//  LogInViewController.swift
//  Carousel
//
//  Created by Zach Cole on 2/8/16.
//  Copyright © 2016 Zach Cole. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var LogInScrollView: UIScrollView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var loginNavBar: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var buttonInitialY = CGFloat(0.0)
    var buttonOffset = CGFloat(0.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        LogInScrollView.delegate = self
        
        LogInScrollView.contentSize = LogInScrollView.frame.size
        LogInScrollView.contentInset.bottom = 100
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -158


    }
    
    override func viewWillAppear(animated: Bool) {
        
        // Set initial transform values 20% of original size
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        // Apply the transform properties of the views
        loginNavBar.transform = transform
        fieldParentView.transform = transform
        // Set the alpha properties of the views to transparent
        loginNavBar.alpha = 0
        fieldParentView.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        
        //Animate the code within over 0.3 seconds...
        UIView.animateWithDuration(0.3) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.loginNavBar.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backButtonDidTap(sender: UIButton) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        print("keyboardWillShow")
        // Move the button up above keyboard
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        // Scroll the scrollview up
        LogInScrollView.contentOffset.y = LogInScrollView.contentInset.bottom
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        // Move the buttons back down to it's original position
        buttonParentView.frame.origin.y = buttonInitialY
    }
    
    func scrollViewDidScroll(LogInScrollView: UIScrollView) {
        
        if LogInScrollView.contentOffset.y <= -15 {
            // Hide the keyboard
            view.endEditing(true)
        }
    }

    @IBAction func didPressSignIn(sender: UIButton) {
        
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            
            let alertController = UIAlertController(title: "Email Required", message: "A valid email and password are required.", preferredStyle: .Alert)
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // handle response here.
            }
            // add the OK action to the alert controller
            alertController.addAction(OKAction)
            
            presentViewController(alertController, animated: true) {}
            
        } else {
            self.activityIndicator.startAnimating()
            
            delay(2) {
                self.activityIndicator.stopAnimating()
                if (self.emailTextField.text == "z@me.com" && self.passwordTextField.text == "password") {
                    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let tutorialVC = mainStoryboard.instantiateViewControllerWithIdentifier("tutorialVC") as! TutorialViewController
                    
                    self.presentViewController(tutorialVC, animated: true, completion: nil)

                } else {
                    let alertController = UIAlertController(title: "Email or Password Incorrect", message: "A valid email and password are required.", preferredStyle: .Alert)
                    // create an OK action
                    let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                    
                    self.presentViewController(alertController, animated: true) {}
                }
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