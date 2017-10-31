//
//  AVFNonIntervalWorker.swift
//  AlphaVantageFrameworkProject
//
//  Created by AJ Bartocci on 10/21/17.
//  Copyright © 2017 AJ Bartocci. All rights reserved.
//

import Foundation

public class AVFNonIntervalWorker<SeriesConfig: AVFNonIntervalSeriesInitializable> {
    
    public typealias Model = SeriesConfig.Model
    public typealias NonIntervalConfig = AVFNonIntervalSeriesConfig<Model>
    private let worker: AVFResponseNetworkCaller<NonIntervalConfig>
//    private let worker: AVFNetworkCallable
    private let apiKey: String
    
    // maybe make a protocol so that networking other than session can be injected ?
    // inject a worker instead, then use the config in order to get all info for network call 
    public init(apiKey: String, session: URLSession? = nil) {
        self.apiKey = apiKey
        self.worker = AVFResponseNetworkCaller<NonIntervalConfig>(session: session)
    }
    
//    public init(apiKey: String, worker: AVFNetworkCallable? = nil) {
//        self.apiKey = apiKey
//        self.worker = worker ?? AVFResponseNetworkCaller<NonIntervalConfig>()
//    }
    
    public func get(symbol: String, size: NonIntervalConfig.OutputSize = .compact, completion: @escaping (Error?, NonIntervalConfig.ResponseType?) -> ()) {

        let type = AVFNonIntervalSeriesType(series: SeriesConfig())
        let config = AVFNonIntervalSeriesConfig<Model>.init(seriesType: type, symbol: .value(symbol), dataType: .json, size: .compact, apiKey: .value(apiKey))
        
        worker.makeNetworkCall(configuration: config, completion: completion)
    }
}
