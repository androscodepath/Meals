//
//  MealsTableViewCell.swift
//  Meals
//
//  Created by Andros Slowley on 2/26/25.
//

import UIKit

class MealsTableViewCell: UITableViewCell {

    @IBOutlet weak var mealLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
