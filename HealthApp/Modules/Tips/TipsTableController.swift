//
//  TipsTableController.swift
//  HealthApp
//
//  Created by Pawan Kumar on 27/10/21.
//

import UIKit

class TipsTableController: UITableViewController {
    
    var tipsData = tipsInfoData

    override func viewDidLoad() {
        super.viewDidLoad()

        // Auto resizing the height of the cell
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
        
        self.title = "Tips Info"
    }

    
}

extension TipsTableController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tipsData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tipsData[section].collapsed ? 0 : tipsData[section].items.count
    }
    
    // Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CollapsibleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CollapsibleTableViewCell ??
            CollapsibleTableViewCell(style: .default, reuseIdentifier: "cell")
        
        let item: Item = tipsData[indexPath.section].items[indexPath.row]
        
        cell.nameLabel.text = item.name
        cell.detailLabel.text = item.detail
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // Header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? ExpandCollapseTableViewHeader ?? ExpandCollapseTableViewHeader(reuseIdentifier: "header")
        
        header.titleLabel.text = tipsData[section].name
        header.arrowLabel.text = ">"
        header.setCollapsed(tipsData[section].collapsed)
        
        header.section = section
        header.delegate = self
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
}

//
// MARK: - Section Header Delegate
//
extension TipsTableController: ExpandCollapseTableViewHeaderDelegate {
    
    func toggleSection(_ header: ExpandCollapseTableViewHeader, section: Int) {
        let collapsed = !tipsData[section].collapsed
        
        // Toggle collapse
        tipsData[section].collapsed = collapsed
        header.setCollapsed(collapsed)
        
        tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
    
}
