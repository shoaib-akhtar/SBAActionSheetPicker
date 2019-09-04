//
//  SBAActionModal.swift
//  Pods-Demo
//
//  Created by Jawad Ali on 30/08/2019.
//


public class SBAActionModal: SBAUiSettings {
    
   private let actions : [Any]
    
    public init(title:String? = nil , actions:[Any] , headerTitleTextColor:UIColor = #colorLiteral(red: 0.1790282428, green: 0.2189618647, blue: 0.2606025934, alpha: 1),bgColor:UIColor = #colorLiteral(red: 0.9367746711, green: 0.9487562776, blue: 0.9694418311, alpha: 1),textFont:UIFont = UIFont.systemFont(ofSize: 17, weight: .medium)) {
        self.actions = actions
       super.init(title: title, color: headerTitleTextColor, bgColor: bgColor, font: textFont)
    }
    
    func hasOneComponent() -> Bool {
        return actions.count == 1
    }
    func totalCount() ->  Int {
        return actions.count - 1
    }
   
    func hasTitle()-> Bool {
        return getTitle() != nil
    }

    func action(at index:Int)-> Any {
        
       return self.actions[index]
    }
    func  getCount()-> Int {
        return self.actions.count
    }
}
