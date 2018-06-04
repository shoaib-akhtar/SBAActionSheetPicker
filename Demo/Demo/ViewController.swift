//
//  ViewController.swift
//  SBAActionSheetPicker
//
//  Created by Shoaib Akhtar on 4/23/18.
//  Copyright © 2018 Shoaib Akhtar. All rights reserved.
//

import UIKit
import SBAActionSheetPicker
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
        
        let actionSheetPicker = SBAActionSheetPicker.create() as SBAActionSheetPicker
        
        let action1 = SBAAction.init(title: "Accessibility", image: #imageLiteral(resourceName: "accessibility")) { (action) in
            print("Accessibility")
            self.imgView.image = action.image
        }
        
        let action2 = SBAAction.init(title: "Acount Balance", image: #imageLiteral(resourceName: "account_balance")) { (action) in
            print("Acount Balance")
            self.imgView.image = action.image

        }
        
        let action3 = SBAAction.init(title: "Close", image: #imageLiteral(resourceName: "close")) { (action) in
            print("Close")
            self.imgView.image = action.image

        }
        
        actionSheetPicker.addActions(actions: [action1,action2,action3])
        
        self.present(actionSheetPicker, animated: false, completion: nil)
        
    }
    
}

