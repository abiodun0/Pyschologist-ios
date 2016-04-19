//
//  Diagnosed.swift
//  Pyschologist
//
//  Created by Abiodun Shuaib on 19/04/2016.
//  Copyright © 2016 Abiodun Shuaib. All rights reserved.
//

import UIKit

class DiagnosedViewController: HappinessViewController, UIPopoverPresentationControllerDelegate {
    override var happiness: Int{
        didSet {
            Diagnostics += [happiness]
        }
    }
    
    private let userDefaults = NSUserDefaults.standardUserDefaults()
    
    var Diagnostics: [Int] {
        get{
            return userDefaults.objectForKey(History.userDefaultsKey) as? [Int] ?? []
        }
        set{
            userDefaults.setObject(newValue, forKey: History.userDefaultsKey)
        }
    }
    private struct History {
        static let showTextIdentify = "diagnostic-history"
        static let userDefaultsKey = "HappinessKey"
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? ShowTextViewController{
            if let destinationString = segue.identifier{
                if let ppc = vc.popoverPresentationController{
                    ppc.delegate = self
                }
                switch destinationString{
                case History.showTextIdentify:
                    vc.longText = "\(Diagnostics)"
                default: break
                }
            }
        }
    }
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
}
