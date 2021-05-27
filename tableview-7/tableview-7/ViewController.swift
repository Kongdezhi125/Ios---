//
//  ViewController.swift
//  tableview-7
//
//  Created by student on 2020/10/28.
//  Copyright © 2020 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableviews: UITableView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func dones(_ sender: Any) {
        self.tableviews.setEditing(false, animated: true)
    }
    
    @IBAction func edits(_ sender: Any) {
        self.tableviews.setEditing(true, animated: true)
    }
    

}
var newtitle = ["俄外长因接触新冠患者隔离 克宫：普京未与其接触","莫拉菲将影响南海中北部 冷空气影响新疆等地","X射线不光能拍胸片还能找星星","为啥要集体学习量子科技？来看看量子科技到底是啥"]
var newauthor = ["新浪新闻","百度新闻","今日头条","百度云头条"]
var newtime = ["2020-20-28","2020-20-27","2020-20-26","2020-20-25"]
var newimage = ["new.jpg","01.jpg","02.jpg","03.jpg","04.jpg"]

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newtime.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "news") as? newTableViewCell
        cell?.newstitle.text = newtitle[indexPath.row]
        cell?.newsauthor.text = newauthor[indexPath.row]
        cell?.newstime.text = newtime[indexPath.row]
        cell?.newsimage.image = UIImage(named: newimage[indexPath.row])
        return cell!
    }
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        if indexPath.row == 1 {
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
        else{

            let action3 = UIAction(title: "爱心", image: UIImage(systemName: "heart")) { (UIAction) in
                print("点击爱心")
            }
            let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
                UIMenu(children: [action3])
            }
            return configuration

        }
        
    }
    
    
}
extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//            self.
        }
    }
    
}
