//
//  ItemDetailsViewController.swift
//  Market
//
//  Created by hayato-shimoji on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit
import APIKit
import FontAwesome

class ItemDetailsViewController: UIViewController {
    var itemID : Int = 0

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let request = ItemRequest(itemId: itemID)
        Session.sendRequest(request) { result in
            switch result {
            case .Success(let response):
                self.navigationItem.title = response.name
                self.nameLabel.text = response.name
                self.priceLabel.text = "\(response.price)円"
                self.descriptionLabel.text = response.desc
                self.itemImageView.sd_setImageWithURL(response.imageURL)
            case .Failure(let error):
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addToCart(sender: AnyObject) {
        Cart.instance.add(itemID, quantity: 1)
        
        let alertController = UIAlertController(title: "カートに追加", message: "\(self.nameLabel.text!)がカートに追加されました。", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default){
            action in NSLog("OKボタンが押されました")
        })
    
        presentViewController(alertController, animated: true, completion: nil)
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
