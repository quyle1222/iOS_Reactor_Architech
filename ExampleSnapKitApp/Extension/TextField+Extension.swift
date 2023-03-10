//import Foundation
//import UIKit
//extension UITextField {
//
//    fileprivate func setPasswordToggleImage(_ button: UIButton) {
//        if (isSecureTextEntry) {
//            button.setImage(UIImage(named: "eye_on"), for: .normal)
//        } else {
//            button.setImage(UIImage(named: "eye_off"), for: .normal)
//        }
//    }
//
//    func enablePasswordToggle(){
//        let button = UIButton(type: .custom)
//        setPasswordToggleImage(button)
//        button.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
//        button.frame = CGRect(x: CGFloat(self.frame.size.width - 10),
//                              y: CGFloat(5),
//                              width: CGFloat(8),
//                              height: CGFloat(8))
//        button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
//        button.contentMode = .scaleToFill
//        button.clipsToBounds = true
//        self.rightView = button
//        self.rightViewMode = .always
//    }
//    @IBAction func togglePasswordView(_ sender: Any) {
//        self.isSecureTextEntry = !self.isSecureTextEntry
//        setPasswordToggleImage(sender as! UIButton)
//    }
//}
