//
//  AVFMonthlyAdjustedConfig.swift
//  AlphaVantageFrameworkProject
//
//  Created by AJ Bartocci on 10/21/17.
//  Copyright © 2017 AJ Bartocci. All rights reserved.
//

import Foundation

public struct AVFMonthlyAdjustedConfig: AVFNonIntervalSeriesInitializable {
    public typealias Model = AVFMonthlyAdjustedModel
    
    public init() {
        
    }
    
    public var objectsKey: String {
        return "Monthly Adjusted Time Series"
    }
    public var function: String {
        return "TIME_SERIES_MONTHLY_ADJUSTED"
    }
    public var timeZoneKey: String {
        return "4. Time Zone"
    }
    public var dateFormat: String {
        return DateFormat.daily.rawValue
    }
}
