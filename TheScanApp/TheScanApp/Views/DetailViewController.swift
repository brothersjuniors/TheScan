//
//  DetailViewController.swift
//  ScanApp
//
//  Created by 近江伸一 on 2023/04/19.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    var str = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = str
      
    }
    
    @IBAction func backButton(_ sender: Any) {
    dismiss(animated: true)
    
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
         self.view.endEditing(true)
     }
    
    override func viewDidAppear(_ animated: Bool) {
//        pushActivityButton(sender: textView)
        
        
    }
    @IBAction func pushActivityButton(sender: AnyObject) {
      
         
        let text = textView.text
     
           
        let items = [text as Any] as [Any]
           
           
           // UIActivityViewControllerをインスタンス化
           let activityVc = UIActivityViewController(activityItems: items, applicationActivities: nil)
           
           // UIAcitivityViewControllerを表示
        self.present(activityVc, animated: true, completion: nil)
       }
    
    
}
