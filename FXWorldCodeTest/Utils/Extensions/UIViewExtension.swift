import UIKit

extension UIView {
    var viewControler:UIViewController?{
        return findViewController()
    }
    
    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        }
        else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        }
        else {
            return nil
        }
    }
}
