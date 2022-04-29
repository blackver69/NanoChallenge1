//
//  TaskTableViewCell.swift
//  NanoChallenge1
//
//  Created by Ricky on 27/04/22.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var imageTask: UIImageView!
    @IBOutlet weak var nameTask: UILabel!
    @IBOutlet weak var buttonTask: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
          super.layoutSubviews()
          //set the values for top,left,bottom,right margins
          let margins = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
          contentView.frame = contentView.frame.inset(by: margins)
          
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
