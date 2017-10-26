//
//  WeeklyAdjustedModel.swift
//  AlphaVantageFrameworkProject
//
//  Created by AJ Bartocci on 10/21/17.
//  Copyright © 2017 AJ Bartocci. All rights reserved.
//

import Foundation

/*
 
 "Meta Data": {
     "1. Information": "Weekly Adjusted Prices and Volumes",
     "2. Symbol": "MSFT",
     "3. Last Refreshed": "2017-10-20",
     "4. Time Zone": "US/Eastern"
 },
 "Weekly Adjusted Time Series": {
     "2017-10-20": {
         "1. open": "77.4200",
         "2. high": "78.9700",
         "3. low": "77.2500",
         "4. close": "78.8100",
         "5. adjusted close": "78.8100",
         "6. volume": "78931157",
         "7. dividend amount": "0.0000"
     }
 }
 */


public class AVFWeeklyAdjustedModel: AVFObjectInitializable {
    
    public var date: Date
    public var open: Double
    public var high: Double
    public var low: Double
    public var close: Double
    public var adjClose: Double
    public var volume: Double
    public var dividendAmt: Double
    
    public required init(date: Date, dict: [String : String]) throws {
        self.date = date
        self.open = try dict.string(for: AVFKey.WeeklyAdj(key: .open).value).doubleValue()
        self.high = try dict.string(for: AVFKey.WeeklyAdj(key: .high).value).doubleValue()
        self.low = try dict.string(for: AVFKey.WeeklyAdj(key: .low).value).doubleValue()
        self.close = try dict.string(for: AVFKey.WeeklyAdj(key: .close).value).doubleValue()
        self.adjClose = try dict.string(for: AVFKey.WeeklyAdj(key: .adjClose).value).doubleValue()
        self.volume = try dict.string(for: AVFKey.WeeklyAdj(key: .volume).value).doubleValue()
        self.dividendAmt = try dict.string(for: AVFKey.WeeklyAdj(key: .dividend).value).doubleValue()
    }
    
}
