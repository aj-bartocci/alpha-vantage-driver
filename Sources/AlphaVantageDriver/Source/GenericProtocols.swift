//
//  GenericProtocols.swift
//  AlphaVantageProject
//
//  Created by AJ Bartocci on 9/28/17.
//  Copyright © 2017 AJ Bartocci. All rights reserved.
//

import Foundation

public protocol AVFSessionable {
    var session: URLSession { get }
}

public protocol AVFResponseTypable {
    associatedtype ResponseType
}

public protocol AVFDataResponseConfigurable: AVFResponseTypable {
    func configureResponse(using data: Data) throws -> ResponseType
}

public protocol AVFDataResponseConfiguration {
    associatedtype DataConfig: AVFDataResponseConfigurable, AVFURLRequestProvider
}

public protocol AVFURLRequestProvider {
    var urlRequest: URLRequest { get }
}

public protocol AVFDataResponseCallable: AVFDataResponseConfiguration {
    func makeNetworkCall(configuration: DataConfig, completion: @escaping (Error?, DataConfig.ResponseType?) -> ())
}

extension AVFDataResponseCallable where Self: AVFNetworkCallable {
    
    func makeNetworkCall(configuration: DataConfig, completion: @escaping (Error?, DataConfig.ResponseType?) -> ()) {
        let req = configuration.urlRequest
        makeNetworkCall(urlRequest: req) { (error, data) in
            if let data = data {
                do {
                    let response = try configuration.configureResponse(using: data)
                    completion(nil, response)
                } catch {
                    completion(error, nil)
                }
            } else if let error = error {
                completion(error, nil)
            } else {
                completion(AVFError.noNetworkResponse, nil)
            }
        }
    }
}

public protocol AVFJSONProcessable {
    func processJSON<ResultType>(from data: Data) throws -> ResultType
}

extension AVFJSONProcessable {
    public func processJSON<ResultType>(from data: Data) throws -> ResultType {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            guard let result = json as? ResultType else {
                throw AVFJSONError.unexpectedType
            }
            return result
        } catch {
            throw error
        }
    }
}

public protocol AVFNetworkCallable: AVFJSONProcessable {
    func makeNetworkCall(urlRequest: URLRequest, completion: @escaping (Error?, Data?) -> ())
    func makeJSONCall<JSONResult>(urlRequest: URLRequest, completion: @escaping(Error?, JSONResult?) -> ())
}

extension AVFNetworkCallable {
    func makeJSONCall<JSONResult>(urlRequest: URLRequest, completion: @escaping(Error?, JSONResult?) -> ()) {
        makeNetworkCall(urlRequest: urlRequest) { (error, data) in
            if let data = data {
                do {
                    let json: JSONResult = try self.processJSON(from: data)
                    completion(nil, json)
                } catch {
                    completion(error, nil)
                }
            } else if let error = error {
                completion(error, nil)
            } else {
                completion(AVFJSONError.noResponse, nil)
            }
        }
    }
}

extension AVFNetworkCallable where Self: AVFSessionable {
    func makeNetworkCall(urlRequest: URLRequest, completion: @escaping (Error?, Data?) -> ()) {
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            if let data = data {
                completion(nil, data)
            } else if let error = error {
                completion(error, nil)
            } else {
                completion(AVFError.noNetworkResponse, nil)
            }
        }
        task.resume()
    }
}

public protocol AVFJSONCallable: AVFNetworkCallable {
    func getJSONDictionary(urlRequest: URLRequest, completion: @escaping (Error?, [String: Any?]?) -> ())
}

extension AVFJSONCallable {
    func getJSONDictionary(urlRequest: URLRequest, completion: @escaping (Error?, [String: Any?]?) -> ())  {
        makeJSONCall(urlRequest: urlRequest, completion: completion)
    }
}

public protocol AVFDataInitializable {
    init(data: Data) throws
}

protocol AVFStringDictParser {
    func parse<Result>(key: String, from dict: [String: Any?]) throws -> Result
}

extension AVFStringDictParser {
    public func parse<Result>(key: String, from dict: [String: Any?]) throws -> Result {
        guard let result = dict[key] as? Result else {
            throw AVFDictionaryError.unexpectedType
        }
        return result
    }
}

public protocol AVFStringRepresentable {
    var stringValue: String { get } 
}







