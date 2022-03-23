//
//  NewsVC.swift
//  HealthApp
//
//  Created by Pawan Kumar on 28/10/21.
//

import UIKit
import SafariServices

class NewsVC: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    // MARK: - Variables
    // MARK: -
    var newsData: [NewsData] = []
    override func viewDidLoad() {
        super.viewDidLoad()


        self.tableView.registerCell(nibName: NewsCell.reusableIdentifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
       
        
        self.title = "News"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.estimatedRowHeight = 504
        self.setUpTableData()

    }
    
    
    private func setUpTableData() {
        self.newsData.removeAll()
        
        var newsObj1 = NewsData()
        newsObj1.title = "News Title 1"
        newsObj1.subtitle = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
        self.newsData.append(newsObj1)
        
        var newObj2 = NewsData()
        newObj2.title = "News Title 2"
        newObj2.subtitle = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
        self.newsData.append(newObj2)
        
        var newObj3 = NewsData()
        newObj3.title = "News Title 3"
        newObj3.subtitle = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
        self.newsData.append(newObj3)
        
        var newObj4 = NewsData()
        newObj4.title = "News Title 3"
        newObj4.subtitle = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
        self.newsData.append(newObj4)
        
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


extension NewsVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: NewsCell.reusableIdentifier, for: indexPath) as? NewsCell else {
            return UITableViewCell()
        }
        cell.titleLabel.text = self.newsData[indexPath.row].title
        cell.subTitleLabel.text = self.newsData[indexPath.row].subtitle
        cell.readMoreButtonTapped = {
            if let url =  URL(string: "https://www.google.co.in") {
            let safariVC = SFSafariViewController(url: url)
            self.present(safariVC, animated: true, completion: nil)
            }
        }
        return cell
    }
}

extension NewsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 504
    }
}


struct NewsData {
    var title: String = ""
    var subtitle: String = ""
    var dateCreated: String = ""
    var link: String = ""
    var image: UIImage = UIImage()
}
