//
//  DefaultTableCell.swift
//  BiliBili
//
//  Created by Near on 2019/7/2.
//  Copyright © 2019年 Yijo. All rights reserved.
//

import UIKit

class DefaultTableCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
