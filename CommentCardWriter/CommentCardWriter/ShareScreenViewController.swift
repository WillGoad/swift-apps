//
//  ShareScreenViewController.swift
//  CommentCardWriter
//
//  Created by Goad, William (PAH) on 25/02/2020.
//  Copyright © 2020 Goad, William (PAH). All rights reserved.
//

import UIKit

class ShareScreenViewController: UIViewController {

    var content: String
    
    
    
    @IBOutlet var resultBox: UITextView!
    
    @IBOutlet var characterCountLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultBox.text = content
        updateCharCount()
        
    }
    
    init?(coder: NSCoder, content: String) {
        self.content = content
        
        super.init(coder: coder)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func copyButton(_ sender: Any) {
        let pasteboard = UIPasteboard.general
        pasteboard.string = resultBox.text
    }
    
    @IBAction func emailButton(_ sender: Any) {
    }
    
    func textViewDidEndEditing(_ resultBox: UITextView) {
        updateCharCount()
        print("It worked")
    }
    
    func updateCharCount(){
        let remaining = 400 - resultBox.text.count
        if remaining < 20 {
            characterCountLabel.textColor = UIColor.orange
        } else if remaining < 0 {
            characterCountLabel.textColor = UIColor.red
        }
        characterCountLabel.text = String(remaining)
    }
    
    @IBAction func ShareButton(_ sender: Any) {
        var texttoshare = resultBox.text
        var URLtoshare = NSURL(string: "https://google.com")
        var objectsToShare:NSArray = [texttoshare, URLtoshare!]
        var activityVC = UIActivityViewController(activityItems: objectsToShare as! [Any], applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }
    
}
