//
//  TeamCell.swift
//  TableView
//
//  Created by huangxiquan on 2017/9/26.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class TeamCell: UITableViewCell {
    
    
    @IBOutlet weak var myLabel: UILabel!

    @IBOutlet weak var myImage: UIImageView!
   override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
