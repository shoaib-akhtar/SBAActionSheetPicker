//
//  SBAInfoTableViewCell.swift
//  SBAActionSheetPicker
//
//  Created by Jawad Ali on 03/09/2019.
//

import UIKit

class SBAInfoTableViewCell: UITableViewCell {

  @IBOutlet weak private var infoTitle: UILabel!
  @IBOutlet weak private var bgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func configure(info:SBAInfo){
        infoTitle.text = info.getTitle()
        infoTitle.textColor = info.getTitleColor()
        bgView.backgroundColor = info.getBgColor()
        infoTitle.textAlignment = info.getTextAlignment()
        infoTitle.font = info.getFont()
    
    }
    
}
