//
//  ViewController.swift
//  CollapsibleTable
//
//  Created by sdnmacmini24 on 10/12/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import UIKit
import CollapsibleTableSectionViewController

class ViewController: CollapsibleTableSectionViewController {
    
    var firstSection:[String]  = ["","","","","","","","",""]
    var secondSection:[String] = ["","","","","","","","","","","","","",""]
    var thirdSection:[String]  = ["","","","","","","","","","","","","","","","","","",]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         self.delegate = self
         self.reloadData()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: CollapsibleTableSectionDelegate {
    func numberOfSections(_ tableView: UITableView) -> Int {
        return 3
    }
    func collapsibleTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return (firstSection.count)
        }else if section == 1 {
            return (secondSection.count)
        }else {
            return (thirdSection.count)
        }
    }
    
    func collapsibleTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ReservationCustomCell = tableView.dequeueReusableCell(withIdentifier: "ReservationCustomCell", for: indexPath) as! ReservationCustomCell
        switch indexPath.section {
        case 0:
            if firstSection.count - 1 == indexPath.row {
                cell.separatorView.isHidden = true
            }else {
                cell.separatorView.isHidden = true
            }
            cell.usernameLbl.text = "\(indexPath.section + 1) Section  - \(indexPath.row) Row"
        case 1:
            if secondSection.count - 1 == indexPath.row {
                cell.separatorView.isHidden = true
            }else {
                cell.separatorView.isHidden = true
            }
             cell.usernameLbl.text = "\(indexPath.section + 1) Section  - \(indexPath.row) Row"
        case 2:
            if thirdSection.count - 1 == indexPath.row {
                cell.separatorView.isHidden = true
            }else {
                cell.separatorView.isHidden = true
            }
            cell.usernameLbl.text = "\(indexPath.section + 1) Section  - \(indexPath.row) Row"
        default:
            break;
        }
        return cell
    }
    
    func collapsibleTableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    func collapsibleTableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "First Section (\(self.firstSection.count))"
        }else if section == 1 {
            return "Second Section (\(self.secondSection.count))"
        }else {
            return "Third Section (\(self.thirdSection.count))"
        }
    }
    
    func collapsibleTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            //self.showPendingController(indexPath)
        }else if indexPath.section == 1 {
           
        }else if indexPath.section == 2  {
    
        }else {
            
        }
    }
    
    func shouldCollapseByDefault(_ tableView: UITableView) -> Bool {
        return true
    }
    
    func shouldCollapseOthers(_ tableView: UITableView) -> Bool {
        return true
    }
    

}
