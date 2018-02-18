//
//  Reachability.swift
//  xing
//
//  Created by Juan Landy on 19/2/18.
//  Copyright © 2018 Juan Landy. All rights reserved.
//

import Foundation
import IMNetworkReachability

func isInternetOn() -> Bool{
    let reachability = IMNetworkReachability("www.google.com")
    
    switch reachability.isReachable() {
    case .reachable:
        return true
    case .offline:
        return false
    case .error(let error):
        print("Failed to check for a network reachability, error: \(error.localizedDescription)")
        return false
        
    }
    
}
