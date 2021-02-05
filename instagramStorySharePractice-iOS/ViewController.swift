//
//  ViewController.swift
//  instagramStorySharePractice-iOS
//
//  Created by kimhyungyu on 2021/02/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sharingImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onClickedBtn(_ sender: UIButton) {
        
        if let urlScheme = URL(string: "instagram-stories://share") {
            
            // 2
            //인스타그램을 열 수 있는지 확인
            if UIApplication.shared.canOpenURL(urlScheme) {
                
                // 3
                guard let image = sharingImageView.image else { return }
                guard let imageData = image.pngData() else { return }
                // 4
                //백그라운드 이미지 공유
                let  pasteboardItems: [String: Any] = [
                            "com.instagram.sharedSticker.stickerImage": imageData,
                            "com.instagram.sharedSticker.backgroundTopColor": "#636e72",
                            "com.instagram.sharedSticker.backgroundBottomColor": "#b2bec3"
                        ]
    //            stickerImage
                //만료 시간 5분.
                let pasteboardOptions = [
                    UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(300)
                ]
                // 5
                UIPasteboard.general.setItems([pasteboardItems], options: pasteboardOptions)
                // 6
                //open
                UIApplication.shared.open(urlScheme, options: [:], completionHandler: nil)
            } else {
                print("instagram can't open")
            }
        }
    }
}

