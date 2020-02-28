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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultBox.text = content
    }
    
    init?(coder: NSCoder, content: String) {
        self.content = content
        
        super.init(coder: coder)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func copyButton(_ sender: Any) {
    }
    
    @IBAction func emailButton(_ sender: Any) {
    }
    
    
}
