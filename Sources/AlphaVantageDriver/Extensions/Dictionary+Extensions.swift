//
//  Dictionary+Extensions.swift
//  AlphaVantageFramework
//
//  Created by AJ Bartocci on 9/25/17.
//  Copyright © 2017 AJ Bartocci. All rights reserved.
//

import Foundation

public typealias StringAnyCollection = [String: Any?]

enum AVFDictionaryError: Error {
    case invalidStringForKey
    case unexpectedType
}

extension Dictionary {
    
    func string(for key: String) throws -> String {
        guard let str = self[key as! Key] as? String else {
            throw AVFDictionaryError.invalidStringForKey   
        }
        return str
    }
}
