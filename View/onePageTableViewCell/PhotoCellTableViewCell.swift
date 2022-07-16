//
//  PhotoCellTableViewCell.swift
//  babyrect-4
//
//  Created by jeanwei on 2022/2/12.
//

import UIKit

class PhotoCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var photoButton: UIButton!
  
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
