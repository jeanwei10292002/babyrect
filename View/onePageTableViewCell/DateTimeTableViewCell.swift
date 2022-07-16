//
//  DateTimeTableViewCell.swift
//  babyrect-4
//
//  Created by jeanwei on 2022/2/11.
//

import UIKit

class DateTimeTableViewCell: UITableViewCell {

  
    @IBOutlet weak var addTimeTextFileld: UITextField!
    @IBOutlet weak var AddIconImageView: UIImageView!
    
    //新增UIDatePicker
    var datePicker = UIDatePicker()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       createDatePicker()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //新增Toolbar ->回傳UIToobar型別
    func createToolbar() -> UIToolbar{
        //toobar
        let toobar = UIToolbar()
        toobar.sizeToFit()
        
        //done 按鈕
        let buttonTitle = "Done"
        let doneBtn = UIBarButtonItem(title: buttonTitle, style: .done, target: self, action: #selector(onClickDoneButton))
        toobar.setItems([doneBtn], animated: true)
        return toobar
    }
    
    
    //新增datepicker
    func createDatePicker(){
        datePicker.date = Date() //將Datepicker的起始時間為當前時間
        datePicker.locale = Locale(identifier: "zh_TW")//設定DatePicker的語系
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .dateAndTime
        addTimeTextFileld.inputView = datePicker
        addTimeTextFileld.inputAccessoryView = createToolbar()
       

        
    }
   
    
    //新增done的按鈕動作
   @objc func onClickDoneButton(){
       let now = Date() //取得現在的時間
       let dateFormat = DateFormatter()////產生時間格式
       dateFormat.dateFormat = "yyyy-MM-dd HH:mm" ////設定時間格式為年月日時分秒
      
       
//     let dateFormatter = DateFormatter()
//       dateFormatter.dateStyle = .medium
//       dateFormatter.timeStyle = .medium
//       self.contentView.endEditing(true)  cell的view 是 contentView
    self.addTimeTextFileld.text = dateFormat.string(from: datePicker.date)
       self.endEditing(true)
    }
    

}
