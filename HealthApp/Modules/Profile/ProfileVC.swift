//
//  ProfileVC.swift
//  HealthApp
//
//  Created by Pawan Kumar on 28/10/21.
//

import UIKit

class ProfileVC: UIViewController {
    
    // MARK: - IBOutlets
    // MARK: -
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var profileNameLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Variables
    // MARK: -
    var profileData: [ProfileData] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.profileNameLabel.text = "Charles"
        self.profileImageView.layer.cornerRadius = 16.0
        self.profileImageView.layer.masksToBounds = true
        self.tableView.registerCell(nibName: ImgTitleRightBtnCell.reusableIdentifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.title = "Profile"
        
        self.setUpTableData()
    }
    
    
    private func setUpTableData() {
        self.profileData.removeAll()
        
        var myDataObj = ProfileData()
        myDataObj.title = "My Data"
        self.profileData.append(myDataObj)
        
        var medicationObj = ProfileData()
        medicationObj.title = "My Medications"
        self.profileData.append(medicationObj)
        
        self.tableView.reloadData()
    }
    
    
    // MARK: IBActions
    // MARK:
    @IBAction func logOutButtonTapped(_ sender: Any) {
        // ...
                // after user has successfully logged out
          
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginNavController = storyboard.instantiateViewController(identifier: "LoginNavigationController")

        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavController,animationType: .transitionCurlUp)
    }
    

}


extension ProfileVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.profileData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: ImgTitleRightBtnCell.reusableIdentifier, for: indexPath) as? ImgTitleRightBtnCell else {
            return UITableViewCell()
        }
        cell.titleLabel.text = self.profileData[indexPath.row].title
        return cell
    }
}

extension ProfileVC: UITableViewDelegate {
    
}


struct ProfileData {
    var title: String = ""
    var systemImageName: String = ""
}
