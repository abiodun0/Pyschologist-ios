//
//  ShowTextViewController.swift
//  Pyschologist
//
//  Created by Abiodun Shuaib on 19/04/2016.
//  Copyright © 2016 Abiodun Shuaib. All rights reserved.
//

import UIKit

class ShowTextViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.text = longText
        }
    }
    
    var longText: String = ""{
        didSet{
            textView?.text = longText
        }
    }
    override var preferredContentSize: CGSize {
        get{
            if textView != nil && presentingViewController != nil {
                return textView.sizeThatFits(presentingViewController!.view.bounds.size)
            }
            return super.preferredContentSize
        }
        set {
            super.preferredContentSize = newValue
        }
    }
    
}
