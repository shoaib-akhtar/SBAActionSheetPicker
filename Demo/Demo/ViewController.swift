//
//  ViewController.swift
//  SBAActionSheetPicker
//
//  Created by Shoaib Akhtar on 4/23/18.
//  Copyright © 2018 Shoaib Akhtar. All rights reserved.
//

import UIKit
import SBAActionSheetPicker
enum UIUserInterfaceIdiom : Int {
    case unspecified
    
    case phone // iPhone and iPod touch style UI
    case pad // iPad style UI
}



class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnClicked(_ sender: Any) {
     
        
        let actionSheetPicker = SBAActionSheetPicker.create(.clear, completion: { (action,section,index)  in
            
//            print("action title:\(String(describing: action.))")
//
//            switch action.title! {
//            case "Delete":
//            print("delete")
//            case "Change Privacy":
//                print("Change Privacy")
//            default :
//                print("other")
//
//            }
            
            
        }) as SBAActionSheetPicker
        
        let action1 = SBAAction.init(title: "Change Privacy")
        let action2 = SBAAction.init(title: "Change Category")
        let action3 = SBAAction.init(title: "Add to insurance",icon:#imageLiteral(resourceName: "facebook"),color :#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bgColor:#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), textAlign: .left )
        let action4 = SBAAction.init(title: "Add to existing claim")
        let action5 = SBAAction.init(title: "Create new claim")
        let action6 = SBAAction.init(title: "Delete")
        let action7 = SBAAction.init(title: "Sort item by date")
        let action8 = SBAAction.init(title: "Sort item by title")
        let action9 = SBAAction.init(title: "Export items")
        let action10 = SBAAction.init(title: "Cancel",color:.red , font: UIFont.systemFont(ofSize: 17, weight: .semibold))
      //  info: "By selecting below options you can apply changes to selected items."
          let info = SBAInfo.init(title: "By selecting below options you can apply changes to selected items.",bgColor:#colorLiteral(red: 0.912222743, green: 0.960431397, blue: 0.9938158393, alpha: 1))
        
        let modalSection1 = SBAActionModal(title: "Grouping Options", actions: [info,action1,action2,action3,action4,action5,action6])
        let modalSection2 = SBAActionModal(title: "Sorting Options", actions: [action7,action8])
        let modalSection3 = SBAActionModal(title: "Export", actions: [action9])
        let modalSection4 = SBAActionModal( actions: [action10])
        actionSheetPicker.addActions(actions: [modalSection1,modalSection2,modalSection3,modalSection4])
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            actionSheetPicker.modalPresentationStyle = .popover
            actionSheetPicker.popoverPresentationController?.sourceView = sender as? UIView
            
            self.present(actionSheetPicker, animated: false, completion: nil)
        }
        else {
            self.present(actionSheetPicker, animated: false, completion: nil)
        }
      
    }
    
}

