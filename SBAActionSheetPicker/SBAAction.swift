//
//  SBAAction.swift
//  SBAActionSheetPicker
//
//  Created by Shoaib Akhtar on 4/24/18.
//  Copyright © 2018 Shoaib Akhtar. All rights reserved.
//

enum SBAType : Int{
    case action
    case info
}

protocol SBAActionType {
    func getTitle() -> String?
    func getTitleColor() -> UIColor
    func getIcon() -> UIImage?
    func getBgColor() -> UIColor
    func getTextAlignment() -> NSTextAlignment
    func type() -> SBAType
}

import UIKit

public class SBAAction: NSObject, SBAActionType {
    private let title : String?
    private let titleColor : UIColor
    private let icon : UIImage?
    private let bgColor: UIColor
    private let textAlignment : NSTextAlignment
    
    public init(title: String?,icon: UIImage? = nil,color : UIColor = #colorLiteral(red: 0, green: 0.07609844953, blue: 0.1716175079, alpha: 1) , bgColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) ,textAlign:NSTextAlignment = .center){
        self.textAlignment = textAlign
        self.title=title
        self.icon=icon
        self.titleColor = color
        self.bgColor=bgColor
        super.init()
       
    }
    func getTitle() -> String? {
        return title
    }
    
    func getTitleColor() -> UIColor {
        return titleColor
    }
    
    func getIcon() -> UIImage? {
        return icon
    }
    
    func getBgColor() -> UIColor {
        return bgColor
    }
    
    func getTextAlignment() -> NSTextAlignment {
        return textAlignment
    }
    
    func type() -> SBAType {
        return .action
    }
    
}

