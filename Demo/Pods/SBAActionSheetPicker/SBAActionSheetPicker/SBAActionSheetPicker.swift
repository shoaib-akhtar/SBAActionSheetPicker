//
//  SBAActionSheetPicker.swift
//  SBAActionSheetPicker
//
//  Created by Shoaib Akhtar on 4/23/18.
//  Copyright © 2018 Shoaib Akhtar. All rights reserved.
//

import UIKit

public class SBAActionSheetPicker: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var bgViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bgView: UIView!
    private var Actions: [SBAAction] = []
    
    public static func create() -> SBAActionSheetPicker {
        let actionSheetPicker = UIStoryboard(name: "SBAActionSheetPicker", bundle: Bundle.init(for: self)).instantiateViewController(withIdentifier: "SBAActionSheetPicker") as! SBAActionSheetPicker
        return actionSheetPicker
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate=self
        self.tableView.dataSource=self
        // Do any additional setup after loading the view.
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            if self.tableView.contentSize.height >= self.view.frame.size.height {
                self.bgViewHeightConstraint.constant=self.view.frame.size.height-64
            }else{
                self.bgViewHeightConstraint.constant=self.tableView.contentSize.height
            }
            self.tableView.scrollToRow(at: IndexPath(item: 0, section: 0), at: UITableViewScrollPosition.top, animated: false)
        }
        self.animateUp()
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func viewTapped(_ sender: Any) {
        self.animateDownAndDismiss(action: nil)
    }
    
    public func animateUp() -> Void {

        let originalFram = self.bgView.frame
        self.bgView.frame = self.bgView.frame.offsetBy(dx: 0, dy: self.bgView.frame.height)
        
        UIView.animate(withDuration: 0.25) {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
            self.bgView.frame=originalFram
        }
    }
    func animateDownAndDismiss(action: SBAAction?) -> Void {
        
        UIView.animate(withDuration: 0.25, animations: {
            self.view.backgroundColor =  UIColor.clear
            self.bgView.frame = self.bgView.frame.offsetBy(dx: 0, dy: self.bgView.frame.height)
        }) { (Completed) in
            self.dismiss(animated: false, completion: {
                if let unwraped : SBAAction = action{
                    unwraped.handleCompletion()
                }
            })
        }
    }
    
   public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.Actions.count
    }
   public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
   public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
   public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 14;
    }
   public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 14;
    }
   public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView.init()
    }
   public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.init()
    }
   public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SBAPickerCell") as? SBAPickerCell
        
        let action = self.Actions[indexPath.row]
        cell?.lblTitle.text=action.title
        cell?.imgView.image=action.image
        return cell!
    }
   public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let action = self.Actions[indexPath.row]
        self.animateDownAndDismiss(action: action)
    }
    
    public func addAction(action: SBAAction) -> Void {
        self.Actions.append(action)
    }
    public func addActions(actions: [SBAAction]) -> Void {
        self.Actions.append(contentsOf: actions)
    }
}
