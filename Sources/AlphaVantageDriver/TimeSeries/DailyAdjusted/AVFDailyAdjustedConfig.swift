//
//  DailyAdjustedConfig.swift
//  AlphaVantageProject
//
//  Created by AJ Bartocci on 9/29/17.
//  Copyright © 2017 AJ Bartocci. All rights reserved.
//

import Foundation

public struct AVFDailyAdjustedConfig: AVFNonIntervalSeriesInitializable {
    
    public typealias Model = AVFDailyAdjustedModel
    public init() {
        
    }
    
    public var objectsKey: String {
        return "Time Series (Daily)"
    }
    public var function: String {
        return "TIME_SERIES_DAILY_ADJUSTED"
    }
    public var timeZoneKey: String {
        return "5. Time Zone"
    }
    public var dateFormat: String {
        return DateFormat.daily.rawValue
    }
}

//enum AVFDailyAdjustedRepresentable: AVFNonIntervalSeriesInterface {
//    case dailyAdjusted
//
//    var objectsKey: String {
//        return "Time Series (Daily)"
//    }
//    var function: String {
//        return "TIME_SERIES_DAILY_ADJUSTED"
//    }
//    var timeZoneKey: String {
//        return "5. Time Zone"
//    }
//    var dateFormat: String {
//        return DateFormat.daily.rawValue
//    }
//}

//typealias AVFDailyAdjustedConfig = AVFNonIntervalSeriesType<AVFDailyAdjustedRepresentable>





