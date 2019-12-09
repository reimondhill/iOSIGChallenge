//
//  ContainerView.swift
//  FXWorldCodeTest
//
//  Created by Ramon Haro Marques on 09/12/2019.
//  Copyright © 2019 IG. All rights reserved.
//

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
