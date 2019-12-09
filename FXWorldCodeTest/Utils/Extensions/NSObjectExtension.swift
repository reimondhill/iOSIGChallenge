import Foundation


extension NSObject{
    
    //MARK: - Properties
    /// Returns the Object log string (Object:) for an static declaration
    static var logClassName: String{
        return NSStringFromClass(self).components(separatedBy: ".").last!.appending(":")
    }
    
    /// Returns the Object log string (Object:)
    var logClassName: String{
        return NSStringFromClass(type(of: self)).components(separatedBy:".").last!.appending(":")
    }
    
    /// Returns the Object name string (Object) for an static declaration
    static var identifier: String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
        //return NSStringFromClass(self).components(separatedBy: ".").last!.appending(" ")
    }
    
    /// Returns the Object name string (Object)
    var identifier: String{
        return NSStringFromClass(type(of: self)).components(separatedBy:".").last!
    }
    
}
