//
//  ViewController.swift
//  instagramStorySharePractice-iOS
//
//  Created by kimhyungyu on 2021/02/04.
//

import UIKit

class ViewController: UIViewController, UIDocumentInteractionControllerDelegate {

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
                //배경 레이어 색상을 지정하지 않을 경우 #222222로 설정됩니다
//                let  pasteboardItems: [String: Any] = [
//                            "com.instagram.sharedSticker.stickerImage": imageData
//                        ]
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
                print("instagram not found")
            }
        }
    }
    // 피드 공유도 해보자.
    @IBAction func onClickedBtnFeedShare(_ sender: Any) {
        if let urlScheme = URL(string: "instagram://app") {
            if UIApplication.shared.canOpenURL(urlScheme) {
                
                guard let image = sharingImageView.image else { return }
                guard let imageData = image.pngData() else { return }
                
                // build the file URL
                let documentPath = (NSTemporaryDirectory() as NSString).appendingPathComponent("image.ig")
                let fileUrl = URL(fileURLWithPath: documentPath)
                
                // write the image data to the file URL
                    do {
                        try imageData.write(to: fileUrl, options: .atomic)
                    } catch {
                        print("Instagram sharing error")
                        return
                    }
                
                // instantiate a new document interaction controller
                // you need to instantiate one document interaction controller per file
                        let documentController = UIDocumentInteractionController(url: fileUrl)
                        documentController.delegate = self
                        // the UTI is given by Instagram
                        documentController.uti = "com.instagram.photo"

                        // open the document interaction view to share to Instagram feed
                
//                        documentController.presentOpenInMenu(from: self.view.frame, in: self.view, animated: true)
                let ac = UIActivityViewController(activityItems: [fileUrl, fileUrl], applicationActivities: nil)
                
                present(ac, animated: true)
                
            } else {
                print("instagram not found")
            }
        }
    }
}

