//
//  CountryTableViewCell.swift
//  JsonDataFetch
//
//  Created by darshan on 31/01/18.
//  Copyright © 2018 darshan. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    
    @IBOutlet var namelbl : UILabel!
    @IBOutlet var lblcapital: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
