//
//  NetworkCallerHelper.swift
//  AlphaVantageFrameworkProject
//
//  Created by AJ Bartocci on 10/21/17.
//  Copyright © 2017 AJ Bartocci. All rights reserved.
//

import Foundation

public protocol AVFResponseNetworkCallable: AVFNetworkCallable, AVFDataResponseCallable {
    
}

class AVFResponseNetworkCaller<Configuration: AVFDataResponseConfigurable & AVFURLRequestProvider>: AVFResponseNetworkCallable, AVFSessionable {
    
    // add init with api key ?
    
    typealias DataConfig = Configuration
    lazy var session: URLSession = URLSession.shared
}
