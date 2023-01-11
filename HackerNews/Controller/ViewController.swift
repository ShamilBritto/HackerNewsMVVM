//
//  ViewController.swift
//  HackerNews
//
//  Created by GGS-BKS on 10/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    let parser = Parser()
    var hitsArray : [Hits] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        parser.parse{
            data in
            self.hitsArray = data.hits ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
}

extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hitsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as? NewsCell
        cell?.setData(title:hitsArray[indexPath.row].title)
        return cell!
    }
}
