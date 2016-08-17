//
//  CategoriesViewController.swift
//  Market
//
//  Created by hayato-shimoji on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit
import APIKit

class CategoriesViewController: UITableViewController {
    
    var categories: [Category] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarItem = UITabBarItem(
            title: "カテゴリ",
            image: UIImage.fontAwesomeIconWithName(.Book, textColor: UIColor.blackColor(), size: CGSizeMake(30, 30)),
            selectedImage: UIImage.fontAwesomeIconWithName(.Book, textColor: UIColor.blueColor(), size: CGSizeMake(30, 30))
        )
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let request = CategoriesRequest()
        Session.sendRequest(request) { result in
            switch result {
            case .Success(let response):
                self.categories = response
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destination = segue.destinationViewController as? CategoryItemsViewController {
            guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
                return
            }
            
            let category = categories[selectedIndexPath.row]
            destination.categoryID = category.id
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("CategoriesCell", forIndexPath: indexPath) as? CategoriesCell else {
            fatalError("Invalid cell")
        }
        
        let category = categories[indexPath.row]
        cell.update(withCategory: category)
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
