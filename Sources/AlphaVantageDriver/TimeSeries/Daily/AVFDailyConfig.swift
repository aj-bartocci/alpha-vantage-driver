//
//  DailyConfig.swift
//  AlphaVantageProject
//
//  Created by AJ Bartocci on 9/28/17.
//  Copyright © 2017 AJ Bartocci. All rights reserved.
//

import Foundation

//struct AVFDailyConfig: AVFNonIntervalSeriesInitializable {
////    case daily
//    public typealias Model = AVFDailyModel
//
//    public var objectsKey: String {
//        return "Time Series (Daily)"
//    }
//    public var function: String {
//        return "TIME_SERIES_DAILY"
//    }
//    public var timeZoneKey: String {
//        return "5. Time Zone"
//    }
//    public var dateFormat: String {
//        return DateFormat.daily.rawValue
//    }
//}

public struct AVFDailyConfig: AVFNonIntervalSeriesInitializable {
    public typealias Model = AVFDailyModel
    
    public init() {
    
    }
    
    public var objectsKey: String {
        return "Time Series (Daily)"
    }
    public var function: String {
        return "TIME_SERIES_DAILY"
    }
    public var timeZoneKey: String {
        return "5. Time Zone" 
    }
    public var dateFormat: String {
        return DateFormat.daily.rawValue
    }
}

//typealias AVFDailyConfig = AVFNonIntervalSeriesType<AVFDailySeriesRepresentable>

