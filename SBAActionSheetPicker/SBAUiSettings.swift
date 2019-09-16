//
//  SBAUiSettings.swift
//  SBAActionSheetPicker
//
//  Created by Jawad Ali on 04/09/2019.
//
import UIKit
protocol SBAUi {
    func getTitle() -> String?
    func getTitleColor() -> UIColor
    func getIcon() -> UIImage?
    func getBgColor() -> UIColor
    func getTextAlignment() -> NSTextAlignment
    func getFont() -> UIFont
}
public class SBAUiSettings: NSObject,SBAUi {
    
    private let title : String?
    private let titleColor : UIColor
    private let icon : UIImage?
    private let bgColor: UIColor
    private let textAlignment : NSTextAlignment
    private let textFont : UIFont
    public init(title: String?,icon: UIImage? = nil,color : UIColor = #colorLiteral(red: 0, green: 0.07609844953, blue: 0.1716175079, alpha: 1) , bgColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) ,textAlign:NSTextAlignment = .center , font: UIFont = .systemFont(ofSize: 15, weight: .regular)){
        self.textAlignment = textAlign
        self.title=title
        self.icon=icon
        self.titleColor = color
        self.bgColor=bgColor
        self.textFont = font
        super.init()
        
    }
    func getFont() -> UIFont {
        return textFont
    }
    public func getTitle() -> String? {
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
}
