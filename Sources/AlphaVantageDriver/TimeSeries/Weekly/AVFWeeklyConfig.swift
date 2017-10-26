//
//  WeeklyConfig.swift
//  AlphaVantageProject
//
//  Created by AJ Bartocci on 9/29/17.
//  Copyright © 2017 AJ Bartocci. All rights reserved.
//

import Foundation

public struct AVFWeeklyConfig: AVFNonIntervalSeriesInitializable {
    public typealias Model = AVFWeeklyModel
    
    public init() {
        
    }
    
    public var objectsKey: String {
        return "Weekly Time Series"
    }
    public var function: String {
        return "TIME_SERIES_WEEKLY"
    }
    public var timeZoneKey: String {
        return "4. Time Zone"
    }
    public var dateFormat: String {
        return DateFormat.daily.rawValue
    }
}

//enum AVFWeeklyRepresentable: AVFNonIntervalSeriesInterface {
//    case weekly
//
//    var objectsKey: String {
//        return "Weekly Time Series"
//    }
//    var function: String {
//        return "TIME_SERIES_WEEKLY"
//    }
//    var timeZoneKey: String {
//        return "4. Time Zone"
//    }
//    var dateFormat: String {
//        return DateFormat.daily.rawValue
//    }
//}

//typealias AVFWeeklyConfig = AVFNonIntervalSeriesType<AVFWeeklyRepresentable>

