//
//  AppDelegate.swift
//  HealthApp
//
//  Created by Pawan Kumar on 27/10/21.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerCell(nibName:String, bundle:Bundle? = Bundle.main, forCellWithReuseIdentifier:String? = nil) {
        let cellWithReuseIdentifier = forCellWithReuseIdentifier ?? nibName
         self.register(UINib(nibName: nibName , bundle: bundle), forCellReuseIdentifier: cellWithReuseIdentifier)
    }
    
    func indexPath(forItem: AnyObject) -> IndexPath? {
        let itemPosition: CGPoint = forItem.convert(CGPoint.zero, to: self)
        return self.indexPathForRow(at: itemPosition)
    }
    
    /// Set table header view & add Auto layout.
     func setTableHeaderView(headerView: UIView) {
         headerView.translatesAutoresizingMaskIntoConstraints = false
         
         // Set first.
         self.tableHeaderView = headerView
         
         // Then setup AutoLayout.
         headerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
         headerView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
         headerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
     }
     
     /// Update header view's frame.
     func updateHeaderViewFrame() {
         guard let headerView = self.tableHeaderView else { return }
         
         // Update the size of the header based on its internal content.
         headerView.layoutIfNeeded()
         
         // ***Trigger table view to know that header should be updated.
         let header = self.tableHeaderView
         self.tableHeaderView = header
     }
}

extension UITableView {
    func setEmptyView(title: String) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        let titleLabel = UILabel()
        //let messageLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        //messageLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 18)
        titleLabel.textColor = UIColor.lightGray
        
        emptyView.addSubview(titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        
        titleLabel.text = title
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        // The only tricky part is here:
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    func restore(_ isSingleLine:Bool = true) {
        self.backgroundView = nil
        
        self.separatorStyle = isSingleLine ? .singleLine : .none
    }
}
