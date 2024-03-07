//
//  UserCell.swift
//  RichFeynDemo
//
//  Created by Sarfaraz Ali on 22/07/23.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var lastName: UILabel!
    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
