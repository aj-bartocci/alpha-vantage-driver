//
//  IntraDay.swift
//  AlphaVantageProject
//
//  Created by AJ Bartocci on 9/28/17.
//  Copyright © 2017 AJ Bartocci. All rights reserved.
//

import Foundation

public enum AVFIntraDayConfig {
    public enum Interval: String {
        case min1 = "1min"
        case min5 = "5min"
        case min15 = "15min"
        case min30 = "30min"
        case min60 = "60min"
    }
    public typealias OutputSize = AVFSeries.OutputSize
    public typealias DataType = AVFSeries.DataType
    public typealias Symbol = AVFSeries.Symbol
    public typealias APIKey = AVFSeries.APIKey
    
    case intraday(symbol: Symbol, interval: Interval, type: DataType, size: OutputSize, apiKey: APIKey)
}

extension AVFIntraDayConfig: AVFURLRequestProvider {
    
    fileprivate var function: String {
        return "TIME_SERIES_INTRADAY"
    }
    
    public var urlRequest: URLRequest {
        let params: String
    
        switch self {
        case .intraday(symbol: let symbol, interval: let interval, type: let dataType, size: let size, apiKey: let apiKey):
            // the param order matters for whatever reason check API Documentation
            params = "function=\(function)&symbol=\(symbol.stringValue)&interval=\(interval.rawValue)&outputsize=\(size.rawValue)&apikey=\(apiKey.stringValue)&datatype=\(dataType.rawValue)"
            break
        }
        let urlString = "\(AVFConstant.baseURLString)\(params))"
        let url = URL(string: urlString)!
        var req = URLRequest(url: url)
        req.httpMethod = "GET"
        return req
    }
}

extension AVFIntraDayConfig: AVFResponseConfigurable {
    public var objectsKey: String {
        switch self {
        case .intraday(symbol: _, interval: let interval, type: _, size: _, apiKey: _):
            return "Time Series (\(interval.rawValue))"
        }
    }
    public var metaKey: String {
        return AVFKey.Intraday(key: .meta).value
    }
    public var timeZoneKey: String {
        return "6. Time Zone"
    }
    public var dateFormat: String {
        return DateFormat.intraDay.rawValue
    }
}

extension AVFIntraDayConfig: AVFDataResponseConfigurable {
    public typealias ResponseType = AVFResponse<AVFIntraDayModel, AVFIntraDayConfig>
    
    public func configureResponse(using data: Data) throws -> AVFResponse<AVFIntraDayModel, AVFIntraDayConfig> {
        return try ResponseType(configurator: self, data: data)
    }
}






