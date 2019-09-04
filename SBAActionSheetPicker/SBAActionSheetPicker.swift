//
//  SBAActionSheetPicker.swift
//  SBAActionSheetPicker
//
//  Created by Shoaib Akhtar on 4/23/18.
//  Copyright © 2018 Shoaib Akhtar. All rights reserved.
//

import UIKit
enum UIUserInterfaceIdiom : Int {
    case unspecified
    case phone
    case pad
}

public class SBAActionSheetPicker: UIViewController {

    private  var handler : ((SBAAction,Int,Int)->Void)?
    @IBOutlet weak private var bgViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak private var tableView: UITableView!{
        didSet{
            tableView.layer.cornerRadius = 10
            tableView.backgroundColor = self.bgColor
            tableView.delegate=self
            tableView.dataSource=self
            tableView.estimatedSectionHeaderHeight = 0
           
        }
    }
    @IBOutlet weak private var bgView: UIView!
    private var actionModals: [SBAActionModal] = []
    private var bgColor : UIColor = .white
    
    public static func create(_ backgroundColor : UIColor = .white ,completion: @escaping ((SBAAction,Int,Int)->Void)) -> SBAActionSheetPicker {
        let actionSheetPicker = UIStoryboard(name: "SBAActionSheetPicker", bundle: Bundle.init(for: self)).instantiateViewController(withIdentifier: "SBAActionSheetPicker") as! SBAActionSheetPicker
        actionSheetPicker.bgColor=backgroundColor
        actionSheetPicker.handler = completion
        return actionSheetPicker
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.async {
            if self.tableView.contentSize.height >= self.view.frame.size.height && UIDevice.current.userInterfaceIdiom == .phone {
                self.bgViewHeightConstraint.constant=self.view.frame.size.height - 64
            }else if  UIDevice.current.userInterfaceIdiom == .phone{
                self.bgViewHeightConstraint.constant=self.tableView.contentSize.height 
            } else if UIDevice.current.userInterfaceIdiom == .pad {
                self.preferredContentSize = CGSize(width: self.tableView.contentSize.width, height: self.tableView.contentSize.height + 20)
               self.bgViewHeightConstraint.constant=self.tableView.contentSize.height
            }

            self.animateUp()
        
        }
    }
    
  
    @IBAction func viewTapped(_ sender: Any) {
        self.animateDownAndDismiss()
    }
    
private func animateUp() -> Void {
    if UIDevice.current.userInterfaceIdiom == .phone{
        let originalFram = self.bgView.frame
        self.bgView.frame = self.bgView.frame.offsetBy(dx: 0, dy: self.bgView.frame.height)
        
        UIView.animate(withDuration: 0.25) {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
            self.bgView.frame=originalFram
        }
    }
}
   private func animateDownAndDismiss() -> Void {
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            
            UIView.animate(withDuration: 0.25, animations: {
                self.view.backgroundColor =  UIColor.clear
                self.bgView.frame = self.bgView.frame.offsetBy(dx: 0, dy: self.bgView.frame.height)
            }) { (Completed) in
                self.dismiss(animated: false, completion:nil)
            }
        }else {
            self.dismiss(animated: false, completion:nil)
        }
    }
    
    
    public func addAction(action: SBAActionModal) -> Void {
        self.actionModals.append(action)
    }
    public func addActions(actions: [SBAActionModal]) -> Void {
        self.actionModals.append(contentsOf: actions)
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
   
        if let touch = touches.first, !bgView.bounds.contains(touch.location(in: bgView))  {
            self.viewTapped(touch)
            return
        }
    }
    
    private  func isLastAction(indexPath:IndexPath)-> Bool {
        return  self.actionModals.count - 1  == indexPath.section
    }
}
extension SBAActionSheetPicker: UITableViewDelegate, UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.actionModals.count
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.actionModals[section].getCount()
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
//    public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if  self.actionModals[section].hasTitle() && !isLastAction(indexPath: IndexPath(row: 0, section: section)) {
            return 40
        }else {
            return 5
        }
    }
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0    ;
    }
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let title = self.actionModals[section].getTitle() {
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "SBAHeaderCell") as? SBAHeaderCell
            headerCell?.headerTitle.text = title
            headerCell?.configure(modal: self.actionModals[section])
            return headerCell
        } else {
            return UIView()
        }
    }
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return   UIView()
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let action =  self.actionModals[indexPath.section].action(at: indexPath.row) as? SBAActionType{
            switch action.type(){
            case .info:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SBAInfoTableViewCell") as? SBAInfoTableViewCell
                cell?.configure(info: action as! SBAInfo)
                return cell!
            case .action:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SBAPickerCell") as? SBAPickerCell
                cell?.indexPath = indexPath
                cell?.configure(action: action as! SBAAction)
                
                if indexPath.row == 0 && !self.actionModals[indexPath.section].hasTitle() {
                    cell?.roundUpperCorners()
                }
                
                if self.actionModals[indexPath.section].hasOneComponent()  {
                    cell?.roundCorners()
                }
                
                if indexPath.row ==  self.actionModals[indexPath.section].totalCount()    {
                    if  (indexPath.section + 1 ) < (self.actionModals.count  ) {
                        
                        let modal = self.actionModals[indexPath.section + 1]
                        
                        if  !modal.hasTitle() {
                            cell?.roundLowerCorners()
                        }
                        
                    }
                    
                }
                
                return cell!
            }
        }
        return UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  let action = self.actionModals[indexPath.section].action(at: indexPath.row) as? SBAAction {
            self.handler?(action,indexPath.section,indexPath.row)
            self.animateDownAndDismiss()
        }
    }
    
}
