//
//  AddListTableViewController.swift
//  babyrect-4
//
//  Created by jeanwei on 2022/2/11.
//

import UIKit

class AddListTableViewController: UITableViewController {

    

    
  
    var IconimageName: String?
    var ItemSection = ["Date & Time","Data","MEMO","Photo"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

        override  func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       
        return 1
        
    }

   
      override  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DateTimeCell")
                as! DateTimeTableViewCell
                if let photoImg = IconimageName{
            cell.AddIconImageView.image = UIImage(named: photoImg)  //named 這邊傳的是字串 不是string? 所以要轉型用if let去存  檔名的名稱圖片 在用 addiconImageView.image去顯示出來
                    }
            return cell
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell")
                as! DataCellTableViewCell
            return cell
        }else  if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MEMOCell")
                as! MEMOCellTableViewCell
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell") as! PhotoCellTableViewCell
            return cell
        }
    }
      override  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
          return ItemSection[section]
//        switch section{
//        case 0:
//            return ItemSection[0]
//        case 1:
//            return ItemSection[1]
//        case 2:
//            return ItemSection[2]
//        default:
//            return ItemSection[3]
//        }
    }
    
      override  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          
       
    }

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


extension AddListTableViewController:UITextViewDelegate{
    func textView(_ textView: UITextView , shouldChangeTextIn range:NSRange,replacementText text:String) ->Bool {
        if text == "\n"{
            self.tableView?.endEditing(false)
            return false
        }
        if range.location >= 30{
            print("超過三十字數了")
            return true
        }
        return true
    }
    
}

