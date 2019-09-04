//
//  SBAPickerCell.swift
//  SBAActionSheetPicker
//
//  Created by Shoaib Akhtar on 4/24/18.
//  Copyright © 2018 Shoaib Akhtar. All rights reserved.
//

import UIKit


public class SBAPickerCell: UITableViewCell {

    @IBOutlet weak private var imgView: UIImageView!
    @IBOutlet weak private var lblTitle: UILabel!
    var indexPath : IndexPath!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
         self.clipsToBounds = true
       
    }
    
    func configure(action:SBAAction) {
       self.lblTitle.text=action.getTitle()
       self.lblTitle.textColor = action.getTitleColor()
       self.contentView.backgroundColor = action.getBgColor()
       self.lblTitle.textAlignment = action.getTextAlignment()
       self.lblTitle.font = action.getFont()
        
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
        } else {
            // Fallback on earlier versions
        }
       
    }
    func roundLowerCorners() {
        
        self.layer.cornerRadius = 10
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
        } else {
            // Fallback on earlier versions
        }
       
    }
    func roundCorners () {
         self.layer.cornerRadius = 10
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner,.layerMaxXMinYCorner]
        } else {
            // Fallback on earlier versions
        }
       
    }
    public override func prepareForReuse() {
        self.layer.cornerRadius = 0
    }
}
