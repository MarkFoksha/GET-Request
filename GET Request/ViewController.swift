//
//  ViewController.swift
//  GET Request
//
//  Created by Марк Фокша on 11.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var postTableView: UITableView!
    
    let url = "https://jsonplaceholder.typicode.com/posts"
    var posts = [Posts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postTableView.dataSource = self
        
        NetworkManager.performURL(url: url) { posts in
            
            guard let posts = posts else { return }
            self.posts = posts
            
            DispatchQueue.main.async {
                self.postTableView.reloadData()
            }
        }
    }
}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        let post = posts[indexPath.row]
        
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.body
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        posts.count
    }
}
