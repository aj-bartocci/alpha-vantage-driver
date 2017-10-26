//
//  NonIntervalSeriesType.swift
//  AlphaVantageProject
//
//  Created by AJ Bartocci on 9/29/17.
//  Copyright © 2017 AJ Bartocci. All rights reserved.
//

import Foundation

public protocol AVFTimeSeriesFunction {
    var function: String { get }
}

public protocol AVFNonIntervalSeriesInterface: AVFObjectsKeyable, AVFTimeZoneKeyable, AVFDateFormattable, AVFTimeSeriesFunction {
    
}

public protocol AVFNonIntervalSeriesInitializable: AVFNonIntervalSeriesInterface {
    associatedtype Model: AVFObjectInitializable
    init()
}

//public protocol SomeProtocol: AVFNonIntervalSeriesInterface {
//    init()
//}
//
//public class AVFNonIntervalSeries<ModelType: AVFObjectInitializable, Config: SomeProtocol>: AVFNonIntervalSeriesInterface {
//    
//    public var objectsKey: String {
//        return config.objectsKey
//    }
//
//    public var timeZoneKey: String {
//        return config.timeZoneKey
//    }
//
//    public var dateFormat: String {
//        return config.dateFormat
//    }
//
//    public var function: String {
//        return config.function
//    }
//
//    public typealias Model = ModelType
//    private let config: Config
//    public required init() {
//        self.config = Config()
//    }
//}

//public enum AVFNonIntervalSeriesType<Series: AVFNonIntervalSeriesInterface>: AVFNonIntervalSeriesRepresentable {
//    public var function: String {
//        switch self {
//        case .series(let series):
////            let capped = series.stringValue.uppercased()
////            return "TIME_SERIES_\(capped)"
//            return series.function
//        }
//    }
//    public var objectsKey: String {
//        switch self {
//        case .series(let series):
//            return series.objectsKey
//        }
//    }
//    public var metaKey: String {
//        return "Meta Data"
//    }
//    public var timeZoneKey: String {
//        switch self {
//        case .series(let series):
//            return series.timeZoneKey
//        }
//    }
//    public var dateFormat: String {
//        switch self {
//        case .series(let series):
//            return series.dateFormat
//        }
//    }
//    case series(Series)
//}

public struct AVFNonIntervalSeriesType: AVFNonIntervalSeriesRepresentable {
    
    private let series: AVFNonIntervalSeriesInterface
    public init(series: AVFNonIntervalSeriesInterface) {
        self.series = series
    }
    
    public var function: String {
        return series.function
    }
    public var objectsKey: String {
        return series.objectsKey
    }
    public var metaKey: String {
        return "Meta Data"
    }
    public var timeZoneKey: String {
        return series.timeZoneKey
    }
    public var dateFormat: String {
        return series.dateFormat
    }
}

