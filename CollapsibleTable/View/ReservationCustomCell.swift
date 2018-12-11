//
//  ReservationCustomCell.swift
//  ChildSittingClient
//
//  Created by Ratnadeep Govande on 09/10/17.
//  Copyright © 2017 Ratnadeep Govande. All rights reserved.
//

import UIKit

class ReservationCustomCell: UITableViewCell {
    
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var separatorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
                usernameLbl.textColor = UIColor.darkGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}
