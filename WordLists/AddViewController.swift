//
//  AddViewController.swift
//  WordLists
//
//  Created by 南伊織 on 6/11/16.
//  Copyright © 2016 南伊織. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    var wordArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        if saveData.arrayForKey("WORD") != nil {
            wordArray = saveData.arrayForKey("WORD")!
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveWord() {
        let wordDictionary = ["english":englishTextField.text!, "japanese":japaneseTextField.text!]
        
        wordArray.append(wordDictionary)
        saveData.setObject(wordArray, forKey: "WORD")

        
        let alert = UIAlertController(title: "SAVED", message: "単語の登録が完了しました", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        englishTextField.text = ""
        japaneseTextField.text = ""
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
