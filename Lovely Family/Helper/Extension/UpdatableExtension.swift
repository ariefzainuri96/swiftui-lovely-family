//
//  CodableExtension.swift
//  Simart UMBY
//
//  Created by фкшуа on 16/12/24.
//

import Foundation

protocol Updatable {}

extension Updatable where Self: Decodable {
    /// Generic function to update any field using key paths
    mutating func update<Value>(_ keyPath: WritableKeyPath<Self, Value>, to value: Value) {
        self[keyPath: keyPath] = value
    }
}
