//
//  FavoritesTableViewCell.swift
//  NanoChallenge1
//
//  Created by Ricky on 27/04/22.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    @IBOutlet weak var imageGoal: UIImageView!
    @IBOutlet weak var nameGoal: UILabel!
    @IBOutlet weak var checkGoal: UIButton!
    @IBOutlet weak var categoryName: UILabel!
    
    
    override func layoutSubviews() {
          super.layoutSubviews()
          //set the values for top,left,bottom,right margins
          let margins = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
          contentView.frame = contentView.frame.inset(by: margins)
          
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
