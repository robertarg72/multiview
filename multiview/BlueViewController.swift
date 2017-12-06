//
//  BlueViewController.swift
//  multiview
//
//  Created by Robert Argume on 2017-12-06.
//  Copyright © 2017 Robert Argume. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func blueButtonPressed(sender: UIButton) {
        let alert = UIAlertController(title: "Blue View Button pressed", message: "You pressed the button on the BLUE view", preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes, I did", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }

}
