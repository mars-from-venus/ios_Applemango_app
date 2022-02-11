//
//  ReportPage.swift
//  segue_example2
//
//  Created by mars on 2022/02/03.
//

import UIKit

let tableTitle:Array<String> = ["다른 카테고리 글이예요.","불법적인 게시물이예요.","불쾌한 내용이 포함되어 있어요.","광고성 게시물이예요.","기타"]

class ReportPage: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var lblTitle:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        lblTitle.layer.borderColor = UIColor.appColor(.backGray).cgColor
        lblTitle.layer.borderWidth = 1
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
    }
    @IBAction func modalCancel(_ sender: UIBarButtonItem){
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgReport"{
            if let destination = segue.destination as? ReportPageDetail{
                if let selectedIndex = self.myTableView.indexPathForSelectedRow?.row{
                    destination.prepareLabel = tableTitle[selectedIndex]
                }
            }
        }
    }
}

extension ReportPage: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableTitle.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.white
        cell.clipsToBounds = true
        cell.textLabel?.text = tableTitle[indexPath.row]
        cell.separatorInset = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 20)

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(item[indexPath.row])")
    }


}
