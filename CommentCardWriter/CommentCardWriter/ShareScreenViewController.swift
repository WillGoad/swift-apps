//
//  ShareScreenViewController.swift
//  CommentCardWriter
//
//  Created by Goad, William (PAH) on 25/02/2020.
//  Copyright © 2020 Goad, William (PAH). All rights reserved.
//

import UIKit
//Use Photo on phone to do updating remaining count
class ShareScreenViewController: UIViewController, UITextViewDelegate {

    var content: String
    
    
    
    @IBOutlet var resultBox: UITextView!
    
    @IBOutlet var characterCountLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultBox!.delegate = self
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
    
    
    

    
    func textViewDidChange(_ resultBox: UITextView) {
        updateCharCount()
        print("It worked")
    }
    
    func updateCharCount(){
        let remaining = 400 - resultBox.text.count
        
        if remaining < 0 {
            characterCountLabel.textColor = UIColor.red
        } else if remaining <= 20 {
            characterCountLabel.textColor = UIColor.orange
        } else if remaining >= 0 {
            characterCountLabel.textColor = UIColor.placeholderText
        }
        characterCountLabel.text = String(remaining)
    }
    
    @IBAction func ShareButton(_ sender: Any) {
        let texttoshare = resultBox.text
        let URLtoshare = NSURL(string: "")
        let objectsToShare:NSArray = [texttoshare ?? "", URLtoshare!]
        let activityVC = UIActivityViewController(activityItems: objectsToShare as! [Any], applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }
    
}
