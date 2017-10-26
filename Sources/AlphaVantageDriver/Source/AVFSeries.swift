//
//  AlphaVantageSeries.swift
//  AlphaVantageProject
//
//  Created by AJ Bartocci on 9/28/17.
//  Copyright © 2017 AJ Bartocci. All rights reserved.
//

import Foundation

public enum AVFSeries {
    public enum OutputSize: String {
        case compact
        case full
    }
    public enum DataType: String {
        case json
        case csv
    }
    public enum Symbol: AVFStringRepresentable {
        case value(String)
        public var stringValue: String {
            switch self {
            case .value(let str):
                return str
            }
        }
    }
    public enum APIKey: AVFStringRepresentable {
        case key(String)
        
        public var stringValue: String {
            switch self {
            case .key(let str):
                return str
            }
        }
    }
    public enum TimePeriod: AVFStringRepresentable {
        case period(UInt)
        
        public var stringValue: String {
            switch self {
            case .period(let period):
                return "\(period)"
            }
        }
    }
    public enum IndicatorSeries: String {
        case open
        case close
        case high
        case low
    }
}
