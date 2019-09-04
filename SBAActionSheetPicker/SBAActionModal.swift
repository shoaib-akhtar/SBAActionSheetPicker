//
//  SBAActionModal.swift
//  Pods-Demo
//
//  Created by Jawad Ali on 30/08/2019.
//


public class SBAActionModal: NSObject {
    
    let sectionTitle : String?
    let actions : [Any]
    
    
    public init(title:String? = nil , actions:[Any] ) {
        self.sectionTitle = title
        self.actions = actions
       
    }
    
    func hasOneComponent() -> Bool {
        return actions.count == 1
    }
    func totalCount() ->  Int {
        return actions.count - 1
    }
   
    func hasTitle()-> Bool {
        return sectionTitle != nil
    }
   
}
