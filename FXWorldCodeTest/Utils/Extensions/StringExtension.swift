//
//  StringExtension.swift
//  iOSArtLogicChallenge
//
//  Created by Ramon Haro Marques on 06/12/2019.
//  Copyright © 2019 Ramon Haro Marques. All rights reserved.
//


import UIKit

extension String{
    
    /// Returns localisable version if any
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
}
