//
//  Errors.swift
//  AlphaVantageProject
//
//  Created by AJ Bartocci on 9/28/17.
//  Copyright © 2017 AJ Bartocci. All rights reserved.
//

import Foundation

enum AVFJSONError: Error {
    case unexpectedType
    case noResponse 
}

//enum DictionaryError: Error {
//    case unexpectedType 
//}

enum AVFError: Error {
    case noNetworkResponse 
    case invalidDate
    case invalidTimeZone
    
    enum IntraDay: Error {
        case invalidMetaData
        case invalidObjectDictionary
    }
}
