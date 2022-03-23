//
//  NewsCell.swift
//  HealthApp
//
//  Created by Pawan Kumar on 29/10/21.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet var topBackgroundView: UIView!
    @IBOutlet var newsImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateCreatedLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var readMoreButton: UIButton!
    
    // MARK: - variables
    var readMoreButtonTapped: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        self.topBackgroundView.layer.cornerRadius = 4.0
        self.topBackgroundView.layer.borderWidth = 1.0
        self.topBackgroundView.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        self.topBackgroundView.addShadow(cornerRadius: 8.0, color: UIColor.gray.withAlphaComponent(0.6), offset: CGSize(width: 1, height: 1), opacity: 0.9, shadowRadius: 8)
        self.readMoreButton.setTitle("Read More", for: .normal)
        self.readMoreButton.setTitleColor(UIColor.purple, for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func readMoreButtonTapped(_ sender: Any) {
        if let handler = readMoreButtonTapped {
            handler()
        }
    }
    
}
