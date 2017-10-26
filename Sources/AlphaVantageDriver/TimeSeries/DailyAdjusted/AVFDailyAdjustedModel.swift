//
//  DailyAdjustedModel.swift
//  AlphaVantageProject
//
//  Created by AJ Bartocci on 9/29/17.
//  Copyright © 2017 AJ Bartocci. All rights reserved.
//

import Foundation

/*
 
 "Meta Data": {
     "1. Information": "Daily Time Series with Splits and Dividend Events",
     "2. Symbol": "MSFT",
     "3. Last Refreshed": "2017-09-25",
     "4. Output Size": "Compact",
     "5. Time Zone": "US/Eastern"
 },
 "Time Series (Daily)": {
     "2017-09-25": {
         "1. open": "74.0900",
         "2. high": "74.2500",
         "3. low": "72.9200",
         "4. close": "73.2600",
         "5. adjusted close": "73.2600",
         "6. volume": "24126544",
         "7. dividend amount": "0.0000",
         "8. split coefficient": "1.0000"
     },
     "2017-09-22": {
         "1. open": "73.9900",
         "2. high": "74.5100",
         "3. low": "73.8500",
         "4. close": "74.4100",
         "5. adjusted close": "74.4100",
         "6. volume": "13969937",
         "7. dividend amount": "0.0000",
         "8. split coefficient": "1.0000"
     }
 }
 
 */

public class AVFDailyAdjustedModel: AVFObjectInitializable {
    
    public var date: Date
    public var open: Double
    public var low: Double
    public var close: Double
    public var adjClose: Double
    public var volume: Double
    public var dividendAmt: Double
    public var splitCo: Double
    
    public required init(date: Date, dict: [String: String]) throws {
        self.date = date
        self.open = try dict.string(for: AVFKey.DailyAdj(key: .open).value).doubleValue()
        self.low = try dict.string(for: AVFKey.DailyAdj(key: .low).value).doubleValue()
        self.close = try dict.string(for: AVFKey.DailyAdj(key: .close).value).doubleValue()
        self.adjClose = try dict.string(for: AVFKey.DailyAdj(key: .adjClose).value).doubleValue()
        self.volume = try dict.string(for: AVFKey.DailyAdj(key: .volume).value).doubleValue()
        self.dividendAmt = try dict.string(for: AVFKey.DailyAdj(key: .dividend).value).doubleValue()
        self.splitCo = try dict.string(for: AVFKey.DailyAdj(key: .split).value).doubleValue()    
    }
}
