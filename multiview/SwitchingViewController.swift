//
//  SwitchingViewController.swift
//  multiview
//
//  Created by Robert Argume on 2017-12-06.
//  Copyright © 2017 Robert Argume. All rights reserved.
//

import UIKit

class SwitchingViewController: UIViewController {
    private var blueViewController: UIViewController!
    private var yellowViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        blueViewController = storyboard?.instantiateViewController(withIdentifier: "Blue") as! BlueViewController
        
        blueViewController.view.frame = view.frame
        SwitchViewController(from: nil, to: blueViewController)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        if blueViewController != nil && blueViewController!.view.superview == nil {
            blueViewController = nil
        }
        if yellowViewController != nil && yellowViewController!.view.superview == nil {
            yellowViewController = nil
        }
    }

    @IBAction func switchViews(sender: UIBarButtonItem) {
        if yellowViewController?.view.superview == nil {
            if yellowViewController == nil {
                yellowViewController = storyboard?.instantiateViewController(withIdentifier: "Yellow") as! YellowViewController
            }
        } else if yellowViewController?.view.superview == nil {
            if blueViewController == nil {
                blueViewController = storyboard?.instantiateViewController(withIdentifier: "Blue") as! BlueViewController
            }
        }
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(1)
        UIView.setAnimationCurve(.easeInOut)
        
        if blueViewController != nil && blueViewController!.view.superview != nil{
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: false)
            yellowViewController.view.frame = view.frame
            SwitchViewController(from: blueViewController, to: yellowViewController)
        } else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: false)
            blueViewController.view.frame = view.frame
            SwitchViewController(from: yellowViewController, to: blueViewController)
        }
    }
    
    private func SwitchViewController(from fromVC: UIViewController?, to toVC: UIViewController?){
        if fromVC != nil {
            fromVC!.willMove(toParentViewController: nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParentViewController()
        }
        
        if toVC != nil {
            self.addChildViewController(toVC!)
            self.view.insertSubview(toVC!.view, at: 0)
            toVC!.didMove(toParentViewController: self)
        }
    }

}
