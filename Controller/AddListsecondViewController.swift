//
//  AddListsecondViewController.swift
//  babyrect-4
//
//  Created by jeanwei on 2022/2/12.
//

import UIKit

class AddListsecondViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    var IconimageNameTwo:String?
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBAction func photoHandler(_ sender: UIButton) {
       //確定tag按鈕 print("\(sender.tag)")
        //把UIImagePickerController()存在一個變數controller
        let controller = UIImagePickerController()
        //如果按鈕tag=0
        if sender.tag == 0 {
            controller.sourceType = .camera //UIImagePickerController()種類就是相機  UIImagePickerController 的 sourceType 控制從相簿選照片或拍照。
        } else {
            controller.sourceType = .photoLibrary //UIImagePickerController()種類就是相簿
        }
        controller.delegate = self //由我(UIImagePickerController())來代理你(controller)
        present(controller, animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Cancel")
        picker.dismiss(animated: true, completion: nil)//取得照片後將imagePickercontroller dismiss
    }
    
    //在選擇完照片後要取得必須實作ImagePickerDelegate中的方法didFinishPickingMediaWithInfo
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("didFinishPickingMediaWithInfo")
        //參數 info 取得圖片相關資料。info 的型別是 dictionary，傳入 key .originalImage 可得到圖片
        if let img = info[.originalImage] as? UIImage {
            photoImageView.image = img
            UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil) //將圖片儲存到 iPhone 的 photo album，必須在info新增 Privacy — Photo Library Additions Usage Description權限，要不然會閃退
        }
        picker.dismiss(animated: true, completion: nil) //取得照片後將imagePickercontroller dismiss
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "datetimeSecondCell")
                as! DateTimesecondTableViewCell
                if let photoImg = IconimageNameTwo{
            cell.AddIconSecondImageView.image = UIImage(named: photoImg)  //named 這邊傳的是字串 不是string? 所以要轉型用if let去存  檔名的名稱圖片 在用 addiconImageView.image去顯示出來
                }
            return cell
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MEMOSecondCell")
                as! MEMOsecondTableViewCell
            return cell
        }
           return UITableViewCell()
       
    }
    
   
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UIImagePickerController.isSourceTypeAvailable 判斷是否支援相簿或拍照
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.navigationItem.leftBarButtonItem = nil
        }
        
        // Do any additional setup after loading the view.
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
//textView鍵盤案return收起 輸入數字限定不超過三十字
extension AddListsecondViewController:UITextViewDelegate{
    func textView(_ textView: UITextView , shouldChangeTextIn range:NSRange,replacementText text:String) ->Bool {
        if text == "\n"{
            self.view?.endEditing(false)
            return false
        }
        if range.location >= 30{
//            print("超過三十字數了")
            return true
        }
        return true
    }
    
}

