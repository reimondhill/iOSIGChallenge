
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var fxWorldCoordinator: FXWorldCoordinator!
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow()
        fxWorldCoordinator = FXWorldCoordinator(window: self.window)
        fxWorldCoordinator.start()
        return true
    }
}
