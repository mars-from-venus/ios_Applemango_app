//
//  PriceCustom.swift
//  segue_example2
//
//  Created by mars on 2021/12/07.
//

import UIKit

let exchangeList:Array<String> = ["빗썸","업비트","바이낸스","코인원","코빗","파이넥스"]

class PriceCustom: UIViewController,UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        if tableView == self.tvView {
            count = exchangeList.count
        }
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: PriceCell?
        if tableView == self.tvView {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as? PriceCell
            cell?.lblName.text = exchangeList[indexPath.row]
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 12)
            if indexPath.row % 2 == 0 {
                cell?.backgroundColor = UIColor.lightGray
            } else{
                cell?.backgroundColor = UIColor.white
            }
        }
        return cell!
        
    }
    @IBOutlet weak var tvView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tvView.delegate = self
        self.tvView.dataSource = self
        self.tvView.rowHeight = 30
        self.tvView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.tvView.isScrollEnabled = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
