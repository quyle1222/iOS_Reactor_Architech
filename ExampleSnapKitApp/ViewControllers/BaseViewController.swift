import UIKit
class BaseViewController:UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showLoading(){
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        alert.view.tintColor = UIColor.black
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(10, 5, 50, 50)) as UIActivityIndicatorView
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .medium
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
    func dismissLoading(_ completion:(()-> Void)? = nil){
        if presentedViewController is UIAlertController {
            dismiss(animated: true,completion: completion)
        }
    }
}
