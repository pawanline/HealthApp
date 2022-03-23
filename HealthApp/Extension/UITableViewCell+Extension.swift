//
//  AppDelegate.swift
//  HealthApp
//
//  Created by Pawan Kumar on 27/10/21.
//
import Foundation
import UIKit

extension UITableViewCell {
    
    class var reusableIdentifier: String {
        return "\(self)"
    }
    
    class func registerAndReuseCell(_ tableView: UITableView) -> UITableViewCell? {
        var cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier)
        if cell == nil {
            tableView.register(UINib(nibName: reusableIdentifier, bundle: nil), forCellReuseIdentifier: reusableIdentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier)
        }
        return cell
    }
    
    /// Search up the view hierarchy of the table view cell to find the containing table view
    var tableView: UITableView? {
        get {
            var table: UIView? = superview
            while !(table is UITableView) && table != nil {
                table = table?.superview
            }
            
            return table as? UITableView
        }
    }

}
