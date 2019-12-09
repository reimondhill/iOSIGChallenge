import UIKit

extension String{
    
    /// Returns localisable version if any
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
}
