//
//  TestingUIKitViewController.swift
//  TraningSwiftUI
//
//  Created by Sigfri on 3/2/26.
//

import UIKit

class TestingUIKitViewController: UIViewController {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = "Teting"
    }
}
