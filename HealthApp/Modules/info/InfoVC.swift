//
//  InfoVC.swift
//  HealthApp
//
//  Created by Pawan Kumar on 27/10/21.
//

import UIKit

class InfoVC: UIViewController {
    

    @IBOutlet var infoButton: LargeSelectionButton!
    @IBOutlet var food: LargeSelectionButton!
    @IBOutlet var tips: LargeSelectionButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Info"
        self.infoButton.setTitle("Info", for: .normal)
        self.food.setTitle("Food", for: .normal)
        self.tips.setTitle("Tips", for: .normal)
    }
    
  
    
    @IBAction func tipsButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tipsVC = storyboard.instantiateViewController(withIdentifier: "TipsTableController")
        self.navigationController?.pushViewController(tipsVC, animated: true)
    }
    
    
   
    

}
