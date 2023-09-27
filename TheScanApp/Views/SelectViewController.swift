//
//  SelectViewController.swift
//  ScanApp
//
//  Created by 近江伸一 on 2023/04/18.
//

import UIKit
import VisionKit

class SelectViewController: UIViewController, DataScannerViewControllerDelegate {
    

    
  let nextViewController = NextViewController()
     var texts: String?
    //データ スキャナーが使用可能かどうかを確認
    private  var scannerAvailable: Bool {
        DataScannerViewController.isSupported && DataScannerViewController.isAvailable
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    func textStartButton() {
        guard scannerAvailable == true else { return }
        //✳️DataScannerViewControllerをインスタンス化
        let dataScanner = DataScannerViewController(recognizedDataTypes: [.text()],qualityLevel: .accurate,isHighFrameRateTrackingEnabled: true, isPinchToZoomEnabled: true, isGuidanceEnabled: true,isHighlightingEnabled: true)
        dataScanner.delegate = self
        present(dataScanner,animated: true) {
            try? dataScanner.startScanning()
            
        }
    }

            func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
                switch item {
                case .text(let text):
                    print("text: \(text.transcript)")
                    UIPasteboard.general.string = text.transcript
                    texts = text.transcript
                    changeView(view:texts!)
                case .barcode(let code):
                    guard let urlString = code.payloadStringValue else { return }
                    guard let url = URL(string: urlString) else { return }
                    UIApplication.shared.open(url)
                    print(urlString)
                    print(url)
                    
                    
                    
                default:
                    print("想定外のエラー")
                }
            }
            func changeView(view: String){
                let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "nextViewController") as! NextViewController
                self.dismiss(animated: true)
                self.present(nextViewController, animated: true, completion: nil)
                nextViewController.str = texts!
                
            }
//            override func viewWillAppear(_ animated: Bool) {
//                super.viewWillAppear(animated)
//               // textStartButton()
//            }
        

    @IBAction func textAction(_ sender: Any) {
        
        textStartButton()
        
    }
    

    
    }
    
