//
//  ViewController.swift
//  RichFeynDemo
//
//  Created by Sarfaraz Ali on 21/07/23.
//

import UIKit
import Alamofire
import SDWebImage
class ViewController: UIViewController {
    var userArray : [User] = []
    @IBOutlet weak var mytableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        mytableview.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        AF.request("https://reqres.in/api/users?page=1&delay=3", encoding:JSONEncoding.default).cURLDescription{print($0)}.responseJSON { [weak self] response in
            if let  jsonData = response.data {
                // let jsonData = response.data(using: .utf8)!
                let user = try! JSONDecoder().decode(UserResponseModel.self, from: jsonData)
                debugPrint(user)
                
                self?.userArray = user.data ?? []
                self?.mytableview.reloadData()
            }
           
        }
    }
   
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = mytableview.dequeueReusableCell(withIdentifier: "UserCell",for: indexPath) as! UserCell
        cell.firstName?.text  = "\(userArray[indexPath.row].first_name ?? "")"
        cell.lastName.text = userArray[indexPath.row].last_name
        cell.email.text = userArray[indexPath.row].email
        DispatchQueue.main.async { [self] in
            cell.userImage.sd_setImage(with: URL(string: userArray[indexPath.row].avatar ?? ""))
        }
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ssr")
        let vc = storyboard?.instantiateViewController(withIdentifier: "UserDaitalViewController") as! UserDaitalViewController
        vc.firNamme = userArray[indexPath.row].first_name ?? ""
        vc.lasName = userArray[indexPath.row].last_name ?? ""
        vc.emai = userArray[indexPath.row].email ?? ""
        vc.image = userArray[indexPath.row].avatar ?? ""
        navigationController?.present(vc, animated: true)
    }
}



