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
    var indexPath : IndexPath!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
       
       
    }
    
    func configure(action:SBAAction) {
        print("index path:\(String(describing: indexPath))")
       self.lblTitle.text=action.getTitle()
       self.lblTitle.textColor = action.getTitleColor()
       self.contentView.backgroundColor = action.getBgColor()
       self.lblTitle.textAlignment = action.getTextAlignment()
        if let img = action.getIcon() {
            imgView.image=img
        } else{
            imgView.isHidden = true
        }
    
    }
    
    func roundUpperCorners() {
        
        self.layer.cornerRadius = 10
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        }
         self.clipsToBounds = true
    }
    func roundLowerCorners() {
        
        self.layer.cornerRadius = 10
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
        }
         self.clipsToBounds = true
    }
    func roundCorners () {
         self.layer.cornerRadius = 10
         self.clipsToBounds = true
    }
    public override func prepareForReuse() {
        self.layer.cornerRadius = 0
    }
}
