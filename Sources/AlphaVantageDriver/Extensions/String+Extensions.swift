//
//  String+Extensions.swift
//  AlphaVantageFramework
//
//  Created by AJ Bartocci on 9/25/17.
//  Copyright © 2017 AJ Bartocci. All rights reserved.
//

import Foundation

enum AVFStringError: Error {
    case invalidDateValue
    case invalidDoubleValue
}

extension String {
    
    func doubleValue() throws -> Double {
        guard let dub = Double(self) else {
            throw AVFStringError.invalidDoubleValue
        }
        return dub
    }
    
    func dateValue(dateFormat: String, timeZone: TimeZone) throws -> Date {
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.dateFormat = dateFormat
        guard let date = formatter.date(from: self) else {
            throw AVFStringError.invalidDateValue
        }
        return date
    }
    
    func dateVal(dateFormat: String, timeZone: TimeZone) -> Date? {
        do {
            return try dateValue(dateFormat: dateFormat, timeZone: timeZone)
        } catch {
            return nil
        }
    }
}
