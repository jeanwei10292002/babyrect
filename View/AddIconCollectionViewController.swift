//
//  AddIconCollectionViewController.swift
//  babyrect-4
//
//  Created by jeanwei on 2022/2/11.
//

import UIKit

private let reuseIdentifier = "Cell"

class AddIconCollectionViewController: UICollectionViewController {
    
    @IBOutlet var addiconCollectionView: UICollectionView!
    let babycategory = ["奶粉","母乳","吃藥","回診看醫生","注射疫苗","便便","紀錄事件","換尿布","量身高","量體溫"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCellSize()
//        let width = floor((UIScreen.main.bounds.width - 2 * 2 - 2 * 2) / 3)
//        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
//        flowLayout?.itemSize = CGSize(width: width, height: width)
//        flowLayout?.estimatedItemSize = .zero
//        flowLayout?.minimumInteritemSpacing = 1
//        flowLayout?.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    func configureCellSize() {
           
            let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
            let width = floor((collectionView.bounds.width - 3 * 2 - 50 * 2) / 3)
            flowLayout?.itemSize = CGSize(width: width, height: width)
            flowLayout?.estimatedItemSize = .zero
            flowLayout?.sectionInset = UIEdgeInsets(top: 150, left: 50, bottom: 0, right: 50)
          
        
            
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return babycategory.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = addiconCollectionView.dequeueReusableCell(withReuseIdentifier: "additemcell", for: indexPath) as! AddlistCollectionViewCell
        cell.addlistImagView.image = UIImage(named: babycategory[indexPath.row])
    
        // Configure the cell
    
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 || indexPath.item == 1 || indexPath.item == 9{
                           print("0")
                            performSegue(withIdentifier: "one", sender: self)
                       }else{
                           print("other item")
                           performSegue(withIdentifier: "two", sender: self)
                       }
    }

    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

    @IBSegueAction func showSecondDetile(_ coder: NSCoder) -> AddListsecondViewController? {
        let controller = AddListsecondViewController(coder: coder)
        let cellId = self.collectionView.indexPathsForSelectedItems?.first?.row
        controller?.IconimageName = babycategory[cellId!]  //把陣列存進avc的inforone的屬性
        controller?.navigationItem.title = babycategory[cellId!]

        return controller
    }


    @IBSegueAction func showDetail(_ coder: NSCoder) -> AddListTableViewController? {
        let controller = AddListTableViewController(coder: coder)
               let cellId = self.collectionView.indexPathsForSelectedItems?.first?.row
               controller?.IconimageName = babycategory[cellId!]  //把陣列存進avc的inforone的屬性
               controller?.navigationItem.title = babycategory[cellId!]
       
               return controller
    }
    

}
