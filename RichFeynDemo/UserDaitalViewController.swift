//
//  UserDaitalViewController.swift
//  RichFeynDemo
//
//  Created by Sarfaraz Ali on 23/07/23.
//

import UIKit
import SDWebImage
class UserDaitalViewController: UIViewController {

    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var userImmage: UIImageView!
     var firNamme = ""
     var lasName = ""
    var emai = ""
    var image = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        userImmage.layer.cornerRadius = 50
        userImmage.layer.borderWidth = 1
        firstName.text = firNamme
        lastName.text = lasName
        email.text  = emai
        userImmage.sd_setImage(with: URL(string: image))
        // Do any additional setup after loading the view.
    }
    


}
