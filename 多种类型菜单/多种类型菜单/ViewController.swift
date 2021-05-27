//
//  ViewController.swift
//  多种类型菜单
//
//  Created by student on 2021/5/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgs: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "menu", image: UIImage(systemName: "phone"), menu: addmenus())
        
        let context = UIContextMenuInteraction(delegate: self)
        imgs.addInteraction(context)
    }

    func addmenus() -> UIMenu {
        let action1 = UIAction(title: "扫一扫", image: UIImage(systemName: "qrcode.viewfinder")) { (UIAction) in
            print("点击扫一扫")
        }
        let action2 = UIAction(title: "看一看", image: UIImage(systemName: "person")) { (UIAction) in
            print("点击看一看")
        }
        let action3 = UIAction(title: "爱心", image: UIImage(systemName: "heart")) { (UIAction) in
            print("点击爱心")
        }
        let menu = UIMenu(children: [action1,action2,action3])
     
        return menu
    }
}
extension ViewController:UIContextMenuInteractionDelegate{
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        let action1 = UIAction(title: "扫一扫", image: UIImage(systemName: "qrcode.viewfinder")) { (UIAction) in
            print("点击扫一扫")
        }
        let action2 = UIAction(title: "看一看", image: UIImage(systemName: "person")) { (UIAction) in
            print("点击看一看")
        }
        let action3 = UIAction(title: "爱心", image: UIImage(systemName: "heart")) { (UIAction) in
            print("点击爱心")
        }
        let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            UIMenu(children: [action1,action2,action3])
        }
        return configuration
    }
    
    
}
