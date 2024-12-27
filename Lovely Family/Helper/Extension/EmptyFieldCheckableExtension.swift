//
//  EmptyFieldCheckableExtension.swift
//  Lovely Family
//
//  Created by фкшуа on 28/12/24.
//

protocol EmptyFieldCheckable {
    var emptyFields: [FormErrorModel] { get }
}

extension EmptyFieldCheckable {
    var emptyFields: [FormErrorModel] {
        let mirror = Mirror(reflecting: self)
        var formErrorList: [FormErrorModel] = []
        
        for child in mirror.children {
            if let value = child.value as? String, value.isEmpty {
                formErrorList.append(FormErrorModel(message: "\((child.label ?? "").camelCaseToWords()) can't be empty", label: child.label ?? ""))
            }
        }
        
        return formErrorList
    }
}
