//
//  ViewController.swift
//  ToastMessage
//
//  Created by Vibhor Gupta on 8/12/19.
//  Copyright © 2019 Vibhor Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func click(_ sender: UIButton) {

        showToastMessage(message: "Hello World")
    }


}


extension UIViewController {



    func showToastMessage(message: String) {

        guard let window = UIApplication.shared.keyWindow  else {
            return
        }

        let toastLabel = UILabel()
        toastLabel.text = message
        toastLabel.textAlignment = .center
        toastLabel.font = UIFont.systemFont(ofSize: 18)
        toastLabel.textColor = .white
        toastLabel.backgroundColor = .gray
        toastLabel.adjustsFontSizeToFitWidth = true
        toastLabel.numberOfLines = 0



        let textSize = toastLabel.intrinsicContentSize
        let labelWidth = min(textSize.width, window.frame.height  - 40)
        let labelHeight = (textSize.width / window.frame.width )*20
        let adjustedHeight =  max( labelHeight  , textSize.height + 20 )
        toastLabel.frame = CGRect(x: 20, y: ( window.frame.height - 90) - adjustedHeight  , width: labelWidth, height: adjustedHeight)
        toastLabel.center.x = window.center.x
        toastLabel.layer.cornerRadius = 10
        toastLabel.layer.masksToBounds = true

        window.addSubview(toastLabel)

        UIView.animate(withDuration: 0.8, animations: {

            toastLabel.alpha = 0.3
            }) { (_) in
        toastLabel.removeFromSuperview()


    }
}






}
