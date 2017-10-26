//
//  AlphaVantageProtocols.swift
//  AlphaVantageProject
//
//  Created by AJ Bartocci on 9/28/17.
//  Copyright © 2017 AJ Bartocci. All rights reserved.
//

import Foundation

//extension DataResponseConfigurable where ResponseType: DataInitializable {
//    func configureResponse(using data: Data) throws -> ResponseType {
//        return try ResponseType(data: data)
//    }
//}

public protocol AVFObjectsKeyable {
    var objectsKey: String { get }
}
public protocol AVFMetaKeyable {
    var metaKey: String { get }
}
public protocol AVFDateFormattable {
    var dateFormat: String { get }
}
public protocol AVFFallbackDateFormattable {
    var fallbackDateFormat: String  { get }
}
public protocol AVFIndicatorKeyable {
    var indicatorKey: String { get }
}

public protocol AVFResponseConfigurable: AVFObjectsKeyable, AVFMetaKeyable, AVFTimeZoneKeyable, AVFDateFormattable {
    
}

public protocol AVIndicatorResponseConfigurable: AVFResponseConfigurable, AVFFallbackDateFormattable, AVFIndicatorKeyable {
    
}

public protocol AVResponseConfigurator {
    associatedtype Configurator: AVFResponseConfigurable
}

// non generic 

public protocol AVFDateDictionaryInitializable {
    init?(dict: [String: Any?], dateString: String, timeZone: TimeZone)
}

//protocol AVResponse: BasicResponse, DateDictionaryInitializable {
//    
//}

public protocol AVFBasicResponse {
    associatedtype Object
    var meta: [String: String] { get }
    var objects: [Object] { get }
}


public protocol AVFObjectInitializable {
    init(date: Date, dict: [String: String]) throws 
//    init(dateString: String, timeZone: TimeZone, dict: [String: String]) throws
}

public protocol AVIndicatorObjectInitializable {
    init(date: Date, value: Double)
}

extension AVFObjectInitializable {
    
    func getDate(dateString: String, dateFormat: String, timeZone: TimeZone) throws -> Date {
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.dateFormat = dateFormat
        guard let date = formatter.date(from: dateString) else {
            throw AVFError.invalidDate
        }
        return date
    }

}

public protocol AVResponseInitializable {
    associatedtype ModelType
    associatedtype Configurator
    var meta: [String: String] { get }
    var objects: [ModelType] { get }
    init(configurator: Configurator, data: Data) throws
}

public protocol AVFTimeZoneKeyable {
    var timeZoneKey: String { get }
}

public protocol AVFNonIntervalSeriesRepresentable: AVFResponseConfigurable, AVFTimeSeriesFunction {
    
}





