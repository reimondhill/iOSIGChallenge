import UIKit

class ContainerView: UIView {

    var previousViewController:UIViewController?
    var currentVieController:UIViewController?
    
    func displayContent(for viewController:UIViewController?){
        
        guard let parentVC = self.viewControler else { return }
        
        previousViewController?.willMove(toParent: nil)
        previousViewController?.view.removeFromSuperview()
        previousViewController?.removeFromParent()
        previousViewController = currentVieController
        
        currentVieController = viewController
        if let viewController = viewController{
            parentVC.addChild(viewController)
            viewController.view.frame = bounds
            addSubview(viewController.view)
            viewController.didMove(toParent: parentVC)
        }
        
    }

}
