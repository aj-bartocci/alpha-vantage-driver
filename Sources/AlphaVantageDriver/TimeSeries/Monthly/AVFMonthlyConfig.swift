//
//  MonthlyConfig.swift
//  AlphaVantageProject
//
//  Created by AJ Bartocci on 9/29/17.
//  Copyright © 2017 AJ Bartocci. All rights reserved.
//

import Foundation

public struct AVFMonthlyConfig: AVFNonIntervalSeriesInitializable {
    public typealias Model = AVFMonthlyModel
    
    public init() {
        
    }
    
    public var objectsKey: String {
        return "Monthly Time Series"
    }
    public var function: String {
        return "TIME_SERIES_MONTHLY"
    }
    public var timeZoneKey: String {
        return "4. Time Zone"
    }
    public var dateFormat: String {
        return DateFormat.daily.rawValue
    }
}

//enum AVFMonthlyRepresentable: AVFNonIntervalSeriesInterface {
//    case monthly
//
//    var objectsKey: String {
//        return "Monthly Time Series"
//    }
//    var function: String {
//        return "TIME_SERIES_MONTHLY"
//    }
//    var timeZoneKey: String {
//        return "4. Time Zone"
//    }
//    var dateFormat: String {
//        return DateFormat.daily.rawValue
//    }
//}

//typealias AVFMonthlyConfig = AVFNonIntervalSeriesType<AVFMonthlyRepresentable>

