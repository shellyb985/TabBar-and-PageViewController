//
//  FeatureTableViewCell.swift
//  DemoShopping
//
//  Created by Shelly Pritchard on 15/07/18.
//  Copyright © 2018 Shelly Pritchard. All rights reserved.
//

import UIKit

class FeatureTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgPic: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var btnRs: UIButton!
    
    @IBOutlet weak var containerVw: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
