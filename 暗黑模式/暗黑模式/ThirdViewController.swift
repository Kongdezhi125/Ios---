//
//  ThirdViewController.swift
//  暗黑模式
//
//  Created by student on 2021/6/2.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //1.info 添加字段
    override var prefersStatusBarHidden: Bool{
        return true
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .darkContent
    }

}
