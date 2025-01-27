//
//  Item.swift
//  List Application
//
//  Created by Home Mac on 25/01/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
