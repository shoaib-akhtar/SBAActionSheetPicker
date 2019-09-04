//
//  HeaderCell.swift
//  SBAActionSheetPicker
//
//  Created by Jawad Ali on 02/09/2019.
//

import UIKit

class SBAHeaderCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var headerTitle: UILabel!

    func configure(modal : SBAActionModal) {
        
        self.headerTitle.textColor = modal.getTitleColor()
        self.headerTitle.font = modal.getFont()
        self.bgView.backgroundColor = modal.getBgColor()
        
    }
}
