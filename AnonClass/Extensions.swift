//
//  Extensions.swift
//  AnonClass
//
//  Created by admin on 4/6/18.
//  Copyright © 2018 Ahmed Khalaf. All rights reserved.
//

import Foundation

func debug(_ closure: () -> ()) {
    #if DEBUG
        closure()
    #endif
}

@discardableResult
func attaching<T>(_ value: T, to: Any) -> T {
    debug {
        print("Attaching \(value) to \(to)")
    }
    objc_setAssociatedObject(to, "\(value)", value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    return value
}
