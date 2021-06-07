//
//  ViewController.swift
//  App国际化
//
//  Created by student on 2021/6/7.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputs: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        inputs.placeholder = NSLocalizedString("INPUT YOU NAME", comment: "")
    }


}

