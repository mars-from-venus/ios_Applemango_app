//
//  ViewController2.swift
//  segue_example2
//
//  Created by mars on 2021/12/06.
//

import UIKit
import JJFloatingActionButton

class ViewController2: UIViewController {

    @IBOutlet weak var myTv : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myTv.delegate = self
        myTv.dataSource = self
        floatingBtn()
    }
    func floatingBtn(){
        let actionButton = JJFloatingActionButton()
        actionButton.addItem(title: "item 1", image: UIImage(named: "writeImage")?.withRenderingMode(.alwaysTemplate)) { item in
          // do something
        }
        view.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
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

extension ViewController2: UITableViewDelegate, UITableViewDataSource {
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.white
        cell.layer.borderWidth = 1
        cell.clipsToBounds = true
        return cell
    }


}

