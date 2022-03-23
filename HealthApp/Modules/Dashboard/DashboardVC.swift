//
//  DashboardVC.swift
//  HealthApp
//
//  Created by Pawan Kumar on 27/10/21.
//

import UIKit

class DashboardVC: UIViewController {

    @IBOutlet var reminderButton: LargeSelectionButton!
    @IBOutlet var journal: LargeSelectionButton!
    
    @IBOutlet var exerciseButton: LargeSelectionButton!
    @IBOutlet var infoButton: LargeSelectionButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Dashboard"
        
        self.reminderButton.setTitle("Reminder", for: .normal)
        self.journal.setTitle("Journal", for: .normal)
        self.exerciseButton.setTitle("Exercise", for: .normal)
        self.infoButton.setTitle("Info", for: .normal)
    }
    
 
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        hidesBottomBarWhenPushed = true
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    @IBAction func reminderButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ReminderVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func jorunalButtonTapped(_ sender: Any) {
    }
    
    @IBAction func exerciseButtonTapped(_ sender: Any) {
    }
    
    @IBAction func infoButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "InfoVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
