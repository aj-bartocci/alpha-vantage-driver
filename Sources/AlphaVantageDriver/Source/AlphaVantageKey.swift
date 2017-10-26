//
//  AlphaVantageKey.swift
//  AlphaVantageProject
//
//  Created by AJ Bartocci on 9/28/17.
//  Copyright © 2017 AJ Bartocci. All rights reserved.
//

import Foundation

//static let dateFormat = "yyyy-MM-dd HH:mm:ss"
////    2017-09-21
//static let dailyFormat = "yyyy-MM-dd"
////    2017-09-26 16:00"
//static let indicatorFormat = "yyyy-MM-dd HH:mm"

public enum DateFormat: String {
    case intraDay = "yyyy-MM-dd HH:mm:ss"
    case daily = "yyyy-MM-dd"
    case dateHourMinute = "yyyy-MM-dd HH:mm"
}

enum AVFKey {
    /*
     "1. open": "74.3100",
     "2. high": "74.3200",
     "3. low": "74.2700",
     "4. close": "74.2750",
     "5. volume": "13166"
     */
    enum KeySetOne: String {
        case meta = "Meta Data"
        case open = "1. open"
        case high = "2. high"
        case low = "3. low"
        case close = "4. close"
        case volume = "5. volume"
    }
    
    /*
     
     "1. open": "74.0900",
     "2. high": "74.2500",
     "3. low": "72.9200",
     "4. close": "73.2600",
     "5. adjusted close": "73.2600",
     "6. volume": "24126544",
     "7. dividend amount": "0.0000",
     "8. split coefficient": "1.0000"
     
     */
    enum KeySetTwo: String {
        case meta = "Meta Data"
        case open = "1. open"
        case high = "2. high"
        case low = "3. low"
        case close = "4. close"
        case adjClose = "5. adjusted close"
        case volume = "6. volume"
        case dividend = "7. dividend amount"
        case split = "8. split coefficient"
    }
    
    /*
    "1. open": "77.4200",
    "2. high": "78.9700",
    "3. low": "77.2500",
    "4. close": "78.8100",
    "5. adjusted close": "78.8100",
    "6. volume": "78931157",
    "7. dividend amount": "0.0000"
    */
    enum KeySetThree: String {
        case meta = "Meta Data"
        case open = "1. open"
        case high = "2. high"
        case low = "3. low"
        case close = "4. close"
        case adjClose = "5. adjusted close"
        case volume = "6. volume"
        case dividend = "7. dividend amount"
    }
    
    case Intraday(key: KeySetOne)
    case DailyAdj(key: KeySetTwo)
    case WeeklyAdj(key: KeySetThree)
    
    var value: String {
        switch self {
        case .Intraday(key: let key):
            return key.rawValue
        case .DailyAdj(key: let key):
            return key.rawValue
        case .WeeklyAdj(key: let key):
            return key.rawValue
        }
    }
}
