//
//  SBAPickerCell.swift
//  SBAActionSheetPicker
//
//  Created by Shoaib Akhtar on 4/24/18.
//  Copyright © 2018 Shoaib Akhtar. All rights reserved.
//

import UIKit

public class SBAPickerCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
