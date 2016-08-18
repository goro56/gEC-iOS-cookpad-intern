//
//  CartViewController.swift
//  Market
//
//  Created by hayato-shimoji on 2016/08/18.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit
import APIKit

class CartViewController: UITableViewController {
    
    var items: [Item] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.tabBarItem = UITabBarItem(
            title: "カート",
            image: UIImage.fontAwesomeIconWithName(.ShoppingCart, textColor: UIColor.blackColor(), size: CGSizeMake(30, 30)),
            selectedImage: UIImage.fontAwesomeIconWithName(.ShoppingCart, textColor: UIColor.blueColor(), size: CGSizeMake(30, 30))
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        items = []
        for itemId in Cart.instance.getItemIds() {
            let request = ItemRequest(itemId: itemId)
            Session.sendRequest(request) { result in
                switch result {
                case .Success(let response):
                    self.items += [response]
                case .Failure(let error):
                    print(error)
                }
            }
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("CartCell", forIndexPath: indexPath) as? CartCell else {
            fatalError("Invalid cell")
        }
        
        let item = items[indexPath.row]
        cell.update(withItem: item, withQuantity: Cart.instance.getQuantity(item.id))
        
        return cell
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
