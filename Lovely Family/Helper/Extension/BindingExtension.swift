//
//  BindingExtension.swift
//  Simart UMBY
//
//  Created by фкшуа on 30/11/24.
//

import SwiftUI

extension Binding {    
    func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(
            get: { self.wrappedValue ?? defaultValue },
            set: { self.wrappedValue = $0 }
        )
    }
}
