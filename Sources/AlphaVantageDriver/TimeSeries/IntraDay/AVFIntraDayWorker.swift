//
//  AVFIntraDayWorker.swift
//  AlphaVantageFrameworkProject
//
//  Created by AJ Bartocci on 10/21/17.
//  Copyright © 2017 AJ Bartocci. All rights reserved.
//

import Foundation

public class AVFIntraDayWorker {
    public typealias IntraDay = AVFIntraDayConfig
    public typealias Response = IntraDay.ResponseType
    
    private let apiKey: String
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    private let worker = AVFResponseNetworkCaller<IntraDay>()
    
    public func get(symbol: String, interval: IntraDay.Interval, size: IntraDay.OutputSize = .compact, completion: @escaping (Error?, Response?) -> ()) {
        let config = IntraDay.intraday(symbol: .value(symbol), interval: interval, type: .json, size: size, apiKey: .key(apiKey))
        worker.makeNetworkCall(configuration: config, completion: completion)
    }
    
    public func getJSON(symbol: String, interval: IntraDay.Interval, size: IntraDay.OutputSize = .compact, completion: @escaping (Error?, StringAnyCollection?) -> ()) {
        let config = IntraDay.intraday(symbol: .value(symbol), interval: interval, type: .json, size: size, apiKey: .key(apiKey))
        worker.makeJSONCall(urlRequest: config.urlRequest, completion: completion)
    }
    
    //    func getCSV(symbol: String, interval: IntraDay.Interval, size: IntraDay.OutputSize = .compact, completion: @escaping (Error?, String?) -> ()) {
    //        let config = IntraDay.intraday(symbol: .value(symbol), interval: interval, type: .csv, size: size, apiKey: .key(apiKey))
    //        worker.makeNetworkCall(urlRequest: config.urlRequest) { (error, data) in
    //            // parse data to string and pass it
    //        }
    //    }
}
