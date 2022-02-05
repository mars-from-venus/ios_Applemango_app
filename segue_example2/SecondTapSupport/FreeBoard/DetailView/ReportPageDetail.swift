//
//  ReportPageDetail.swift
//  segue_example2
//
//  Created by mars on 2022/02/05.
//

import UIKit

class ReportPageDetail: UIViewController {
    
    var prepareLabel : String?
    
    @IBOutlet weak var lblTitle:UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblTitle.text = prepareLabel!
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
