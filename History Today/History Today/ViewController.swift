//
//  ViewController.swift
//  History Today
//
//  Created by 马李军 on 2021/4/8.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var historyTableView: UITableView!
    var dataSoure = [History]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        get()
    }


}
extension ViewController {
    
    
    
    func get() {
        let url = URL(string:"http://v.juhe.cn/todayOnhistory/queryEvent?date=1/1&key=758e7715eb527c50ac12b62aa2ddee8d")

        let urlRequest = URLRequest(url: url!)

        let config = URLSessionConfiguration.default

        let session = URLSession(configuration: config)

        let task = session.dataTask(with: urlRequest) { data, response, error in
            if error != nil {
                print(error!)
            } else {
                let httpResp = response as! HTTPURLResponse
                print(httpResp.statusCode)

                if let data = data {
                    if let historyModels = try? JSONDecoder().decode(HistoryModels.self, from: data) {
                        self.dataSoure = historyModels.result
                        
                        DispatchQueue.main.async {
                            self.dataSoure = historyModels.result
                            
                            self.historyTableView.reloadData()
                        }
                    }
                }
            }
        }

        task.resume()
    }
}
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSoure.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "abc")
//        images = dataSoure[indexPath.row].url
        cell?.textLabel?.text = dataSoure[indexPath.row].title
//        cell?.detailTextLabel?.text = dataSoure[indexPath.row].url
//        cell?.imageView?.image = UIImage(cgImage: images as! CGImage)
        return cell!
    }
    
    
}

//extension ViewController : UITableViewDelegate {
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detailVC = DetailViewController()
//        
//        detailVC.passdNews = dataSoure[indexPath.row]
//        
//        navigationController?.pushViewController(detailVC, animated: true)
//        
////        view.addSubview()
//        
//    }
//    
//}
