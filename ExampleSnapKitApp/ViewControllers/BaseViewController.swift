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
}
