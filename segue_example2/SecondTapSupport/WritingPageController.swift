//
//  WritingPageController.swift
//  segue_example2
//
//  Created by mars on 2022/01/19.
//

import UIKit
import DropDown

class WritingPageController: UITableViewController,UITextViewDelegate {

    @IBOutlet weak var drBtn : UIButton!
//    @IBOutlet weak var myView : UIView!
    @IBOutlet weak var myTextView : UITextView!
    @IBOutlet weak var myTableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //        myView.layer.borderWidth = 0.5
        //        myView.layer.borderColor = UIColor.gray.cgColor
        placeholderSetting()
        textViewDidBeginEditing(myTextView)
        textViewDidEndEditing(myTextView)
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
    func placeholderSetting() {
        myTextView.delegate = self // txtvReview가 유저가 선언한 outlet
        myTextView.text = "제가 바로 PlaceHolder입니다."
        myTextView.textColor = UIColor.lightGray
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "내용작성"
            textView.textColor = UIColor.lightGray
        }
    }
    
    func makeDropDown(){
        let dropDown = DropDown()
        dropDown.dataSource = ["인기게시물","자유게시판","유머게시판","질문/답변","차트분석"]
        dropDown.show()
        dropDown.anchorView = drBtn
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.textFont = UIFont.systemFont(ofSize: 15)
        dropDown.cornerRadius = 15
        dropDown.selectedTextColor = .white
        dropDown.selectionBackgroundColor = UIColor.appColor(.mainColor)
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
//            guard let _ = self else { return }
            drBtn.setTitle(item, for: .normal)
//            print("인덱스 : \(index)")
            //test apply
        }
    }
    
    @IBAction func dropBtn(_ sender:UIButton){
        makeDropDown()
//        self.dropDown.clearSelection()
    }
    @IBAction func modalDismiss(_ sender:UIBarButtonItem){
        self.dismiss(animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
//        let background = UIView()
//           background.backgroundColor = .clear
//           cell.selectedBackgroundView = background
//        return cell
//    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
