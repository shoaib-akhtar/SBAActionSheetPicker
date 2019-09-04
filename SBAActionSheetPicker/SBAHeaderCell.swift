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
    public var headerTitleTextColor      = #colorLiteral(red: 0.1790282428, green: 0.2189618647, blue: 0.2606025934, alpha: 1)
    public var bgColor = #colorLiteral(red: 0.9367746711, green: 0.9487562776, blue: 0.9694418311, alpha: 1)
    public var textFont = UIFont.systemFont(ofSize: 17, weight: .medium)
    
    override func awakeFromNib() {
        
        
        
        super.awakeFromNib()
        
        
        
        // Initialization code
    }

    func configure() {
        
        self.headerTitle.textColor = headerTitleTextColor
        self.headerTitle.font = textFont
        self.bgView.backgroundColor = bgColor
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
