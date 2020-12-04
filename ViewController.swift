//
//  ViewController.swift
//  Plain Or Passteboard
//
//  Created by Yebin Park on 2020-11-30.
//  Copyright © 2020 Yebin Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let DATA_KEY = "data_key"
    
    @IBOutlet weak var textView: UITextView!
    
    //creating string array
    var pastedStrings: [String] = []
    
    override func viewDidLoad() {
           super.viewDidLoad()
        if let loadedStrings = UserDefaults.standard.stringArray(forKey: DATA_KEY) {
            pastedStrings.append(contentsOf: loadedStrings)
        }
        showText()
    }
    
    //creating addText
    func addText() {
        
        /*NOTE: guard allows to stop executing code in this method if a certain condition is not met.
          It return when text is already inside of the array. If not, it will add into the array */
        guard let text = UIPasteboard.general.string, !pastedStrings.contains(text) else {
            return
        }
        pastedStrings.append(text)
        //The data will be saved to persistent storage
        UserDefaults.standard.set(pastedStrings, forKey: DATA_KEY)
        showText()
    }
    
    //The showText method dispaly any copied strings from pastedStrings array
    func showText() {
        textView.text = ""
        for str in pastedStrings {
            textView.text.append("\(str)\n\n")
        }
    }
    
    //This method will remove all of the saved data OR there will be only the single last thing that copied 
    @IBAction func trashWasPressed(_ sender: Any) {
        pastedStrings.removeAll()
        textView.text = ""
        UserDefaults.standard.removeObject(forKey: DATA_KEY)
        
    }
    

}

