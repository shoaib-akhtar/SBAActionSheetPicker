//
//  SBAInfoTableViewCell.swift
//  SBAActionSheetPicker
//
//  Created by Jawad Ali on 03/09/2019.
//

import UIKit

class SBAInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var infoTitle: UILabel!
    @IBOutlet weak var bgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(info:SBAInfo){
        infoTitle.text = info.getTitle()
        infoTitle.textColor = info.getTitleColor()
        bgView.backgroundColor = info.getBgColor()
    
    }
    
}
