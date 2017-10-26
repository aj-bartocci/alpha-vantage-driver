//
//  IntraDayModel.swift
//  AlphaVantageProject
//
//  Created by AJ Bartocci on 9/28/17.
//  Copyright © 2017 AJ Bartocci. All rights reserved.
//

import Foundation

/*
 
 "Meta Data": {
     "1. Information": "Intraday (1min) prices and volumes",
     "2. Symbol": "MSFT",
     "3. Last Refreshed": "2017-09-22 10:18:00",
     "4. Interval": "1min",
     "5. Output Size": "Compact",
     "6. Time Zone": "US/Eastern"
 },
 "Time Series (1min)": {
     "2017-09-22 10:18:00": {
     "1. open": "74.3100",
     "2. high": "74.3200",
     "3. low": "74.2700",
     "4. close": "74.2750",
     "5. volume": "13166"
     },
     "2017-09-22 10:17:00": {
     "1. open": "74.3300",
     "2. high": "74.3350",
     "3. low": "74.3050",
     "4. close": "74.3050",
     "5. volume": "13951"
     }
 } 
 
 */

//protocol DateFormattable {
//    var dateFormat: String { get }
//}

public class AVFIntraDayModel: AVFObjectInitializable {
    public var date: Date
    public var open: Double
    public var low: Double
    public var close: Double
    public var volume: Double
    
    public required init(date: Date, dict: [String: String]) throws {
        self.date = date
        self.open = try dict.string(for: AVFKey.Intraday(key: .open).value).doubleValue()
        self.low = try dict.string(for: AVFKey.Intraday(key: .low).value).doubleValue()
        self.close = try dict.string(for: AVFKey.Intraday(key: .close).value).doubleValue()
        self.volume = try dict.string(for: AVFKey.Intraday(key: .volume).value).doubleValue()
    }
}







