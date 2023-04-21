//
//  NextViewController.swift
//  ScanApp
//
//  Created by 近江伸一 on 2023/03/04.


import UIKit
//import RealmSwift
class NextViewController: UIViewController {
  //  let realm = try! Realm()
    var str = ""
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        textView.text = str
        if textView.text == "" {
            return
        } else {
            
            showAleart()
        }
       
    }

        
    
    
    @IBAction func backButton(_ sender: UIButton) {

            self.dismiss(animated: true)
        
       
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
            self.view.endEditing(true)
        }
    func showAleart(){
        // UIAlertControllerの生成
         let alert = UIAlertController(title: "スキャンしたデーアを保存しますか？", message: "取得したデータ", preferredStyle: .alert)

         // アクションの生成
        let yesAction = UIAlertAction(title: "はい", style: .default) { [self] action in
       //      Helper().saveDate(name: textView.text )
            textView.text = ""
            
         }
    

         let noAction = UIAlertAction(title: "いいえ", style: .destructive) { action in
            
         }

//         let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel) { action in
//
//         }

         // アクションの追加
         alert.addAction(yesAction)
         alert.addAction(noAction)
//         alert.addAction(cancelAction)

         // UIAlertControllerの表示
         present(alert, animated: true, completion: nil)
      
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if textView.text == "" {
            return
        } else {
            
            showAleart()
        }
    }

    
}
