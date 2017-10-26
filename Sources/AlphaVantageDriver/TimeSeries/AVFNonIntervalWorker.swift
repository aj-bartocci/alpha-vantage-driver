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
    private let worker = AVFResponseNetworkCaller<NonIntervalConfig>()
    private let apiKey: String
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    public func get(symbol: String, size: NonIntervalConfig.OutputSize = .compact, completion: @escaping (Error?, NonIntervalConfig.ResponseType?) -> ()) {

        let type = AVFNonIntervalSeriesType(series: SeriesConfig())
        let config = AVFNonIntervalSeriesConfig<Model>.init(seriesType: type, symbol: .value(symbol), dataType: .json, size: .compact, apiKey: .value(apiKey))
        worker.makeNetworkCall(configuration: config, completion: completion)
    }
}
