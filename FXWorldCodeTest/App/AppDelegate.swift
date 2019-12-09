
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static var shared:AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }
    static var coordinator: Coordinator {
        return shared.fxWorldCoordinator
    }
    
    var fxWorldCoordinator: FXWorldCoordinator!
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow()
        fxWorldCoordinator = FXWorldCoordinator(window: self.window)
        //fxWorldCoordinator.start()
        return true
    }
}
