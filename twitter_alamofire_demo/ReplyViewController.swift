//
//  ReplyViewController.swift
//  twitter_alamofire_demo
//
//  Created by Mario Martinez on 3/9/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ReplyViewController: UIViewController {

    @IBOutlet weak var replyText: UITextField!
    var tweet: Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapReply(_ sender: Any) {
        var replyTweet: [String: Any] = [:]
        
        replyTweet["text"] = self.replyText.text! + "@" + tweet.user.screenName
        replyTweet["id"] = tweet.id
        print(tweet.id)
        print(replyText.text)
        print(replyTweet["text"]!)
        
        APIManager.shared.reply(with: replyTweet) { (tweet, error) in
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                //self.delegate?.did(post: tweet)
                print("Reply Tweet Success!")
            }
        }
        navigationController?.popViewController(animated: true)

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
