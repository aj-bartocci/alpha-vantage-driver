//
//  NonIntervalTimeSeries.swift
//  AlphaVantageProject
//
//  Created by AJ Bartocci on 9/28/17.
//  Copyright © 2017 AJ Bartocci. All rights reserved.
//

import Foundation

//public protocol AVFNonIntervalSeriesConfigurable {
//    typealias OutputSize = AVFSeries.OutputSize
//    typealias DataType = AVFSeries.DataType
//    typealias Symbol = AVFSeries.Symbol
//    typealias APIKey = AVFSeries.Symbol
//}

//enum AVFNonIntervalSeriesConfig<Model: AVFObjectInitializable, SeriesType: AVFNonIntervalSeriesRepresentable>: AVFNonIntervalSeriesConfigurable {
//
////    typealias OutputSize = AVFSeries.OutputSize
////    typealias DataType = AVFSeries.DataType
////    typealias Symbol = AVFSeries.Symbol
////    typealias APIKey = AVFSeries.Symbol
//
////    let type = NonIntervalSeriesType<DailySeriesRepresentable>.series(.daily)
//
//    case timeSeries(type: SeriesType, symbol: Symbol, dataType: DataType, size: OutputSize, apiKey: APIKey)
//}
//
//extension AVFNonIntervalSeriesConfig: AVFURLRequestProvider {
//
//    //https://www.alphavantage.co/query?function=TIME_SERIES_WEEKLY&symbol=MSFT&apikey=demo
//    var urlRequest: URLRequest {
//        let paramString: String
//        switch self {
//        case .timeSeries(type: let seriesType, symbol: let symbol, dataType: let data, size: let size, apiKey: let apiKey):
//            paramString = "function=\(seriesType.function)&symbol=\(symbol.stringValue)&outputsize=\(size.rawValue)&apikey=\(apiKey.stringValue)&datatype=\(data.rawValue)"
//            break
//        }
//        let urlString = "\(AVFConstant.baseURLString)\(paramString)"
//        let url = URL(string: urlString)!
//        var req = URLRequest(url: url)
//        req.httpMethod = "GET"
//        return req
//    }
//}
//
//extension AVFNonIntervalSeriesConfig: AVFResponseConfigurable {
//    var metaKey: String {
//        switch self {
//        case .timeSeries(type: let series, symbol: _, dataType: _, size: _, apiKey: _):
//            return series.metaKey
//        }
//    }
//    var objectsKey: String {
//        switch self {
//        case .timeSeries(type: let series, symbol: _, dataType: _, size: _, apiKey: _):
//            return series.objectsKey
//        }
//    }
//    var timeZoneKey: String {
//        switch self {
//        case .timeSeries(type: let series, symbol: _, dataType: _, size: _, apiKey: _):
//            return series.timeZoneKey
//        }
//    }
//    var dateFormat: String {
//        switch self {
//        case .timeSeries(type: let series, symbol: _, dataType: _, size: _, apiKey: _):
//            return series.dateFormat
//        }
//    }
//}
//
//extension AVFNonIntervalSeriesConfig: AVFDataResponseConfigurable {
//    typealias ResponseType = AVFResponse<Model, AVFNonIntervalSeriesConfig>
//
//    func configureResponse(using data: Data) throws -> AVFResponse<Model, AVFNonIntervalSeriesConfig<Model, SeriesType>> {
//        return try ResponseType(configurator: self, data: data)
//    }
//}
public protocol AVFNonIntervalSeriesConfigurable {
    associatedtype OutputSize = AVFSeries.OutputSize
    associatedtype DataType = AVFSeries.DataType
    associatedtype Symbol = AVFSeries.Symbol
    associatedtype APIKey = AVFSeries.Symbol
}

public struct AVFNonIntervalSeriesConfig<Model: AVFObjectInitializable>: AVFNonIntervalSeriesConfigurable {
    
    public typealias OutputSize = AVFSeries.OutputSize
    public typealias DataType = AVFSeries.DataType
    public typealias Symbol = AVFSeries.Symbol
    public typealias APIKey = AVFSeries.Symbol
    
    //    let type = NonIntervalSeriesType<DailySeriesRepresentable>.series(.daily)
    
//    case timeSeries(type: SeriesType, symbol: Symbol, dataType: DataType, size: OutputSize, apiKey: APIKey)
    let seriesType: AVFNonIntervalSeriesRepresentable
    let symbol: Symbol
    let dataType: DataType
    let size: OutputSize
    let apiKey: APIKey
//    init(type: SeriesType, symbol: Symbol, dataType: DataType, size: OutputSize, apiKey: APIKey) {
//
//    }
}

extension AVFNonIntervalSeriesConfig: AVFURLRequestProvider {
    
    //https://www.alphavantage.co/query?function=TIME_SERIES_WEEKLY&symbol=MSFT&apikey=demo
    public var urlRequest: URLRequest {
        let paramString = "function=\(seriesType.function)&symbol=\(symbol.stringValue)&outputsize=\(size.rawValue)&apikey=\(apiKey.stringValue)&datatype=\(dataType.rawValue)"
        let urlString = "\(AVFConstant.baseURLString)\(paramString)"
        let url = URL(string: urlString)!
        var req = URLRequest(url: url)
        req.httpMethod = "GET"
        return req
    }
}

extension AVFNonIntervalSeriesConfig: AVFResponseConfigurable {
    public var metaKey: String {
        return seriesType.metaKey
    }
    public var objectsKey: String {
        return seriesType.objectsKey
    }
    public var timeZoneKey: String {
        return seriesType.timeZoneKey
    }
    public var dateFormat: String {
        return seriesType.dateFormat
    }
}

extension AVFNonIntervalSeriesConfig: AVFDataResponseConfigurable {
    public typealias ResponseType = AVFResponse<Model, AVFNonIntervalSeriesConfig>
    
    public func configureResponse(using data: Data) throws -> AVFResponse<Model, AVFNonIntervalSeriesConfig<Model>> {
        return try ResponseType(configurator: self, data: data)
    }
}
