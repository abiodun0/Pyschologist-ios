//
//  ViewController.swift
//  Pyschologist
//
//  Created by Abiodun Shuaib on 18/04/2016.
//  Copyright © 2016 Abiodun Shuaib. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {
    @IBAction func doNothing(sender: UIButton) {
        performSegueWithIdentifier("nothing", sender: nil)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as? UIViewController
        if let navDestination = destination as? UINavigationController{
            destination = navDestination.visibleViewController
        }
        if let vc = destination as? HappinessViewController{
            if let identifier = segue.identifier{
                switch identifier {
                case "sad":
                    vc.happiness = 0
                    print("sad")
                case "meh":
                    vc.happiness = 50
                    print("meh")
                case "happy":
                    vc.happiness = 100
                    print("happy")
                case "nothing":
                    vc.happiness = 25
                    print("nothing")
                default:
                    vc.happiness = 50
                }
            }
        }
    }

}

