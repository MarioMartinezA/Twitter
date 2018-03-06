//
//  DetailViewController.swift
//  twitter_alamofire_demo
//
//  Created by Mario Martinez on 3/5/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var screen_nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var favoriteCountLabel: UILabel!
    
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var tweet: Tweet?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var tweet: Tweet! {
            didSet {
                messageLabel.text = tweet.text
                usernameLabel.text = tweet.user.name
                screen_nameLabel.text = tweet.user.screenName
                dateLabel.text = tweet.createdAtString
                
                retweetCountLabel.text = String(tweet.retweetCount)
                favoriteCountLabel.text = String(tweet.favoriteCount)
                
                profileImageView.af_setImage(withURL: tweet.user.profileImage!)
                
                if tweet.favorited! {
                    favoriteButton.setImage(UIImage(named: "favor-icon-red.png"), for: UIControlState.normal)
                }
                if tweet.retweeted {
                    retweetButton.setImage(UIImage(named: "retweet-icon-green.png"), for: UIControlState.normal)
                }
                
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
