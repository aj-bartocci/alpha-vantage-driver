//
//  AVResponse.swift
//  AlphaVantageProject
//
//  Created by AJ Bartocci on 9/28/17.
//  Copyright © 2017 AJ Bartocci. All rights reserved.
//

import Foundation

public struct AVFResponse<Model: AVFObjectInitializable, Config: AVFResponseConfigurable>: AVResponseInitializable, AVResponseConfigurator, AVFJSONProcessable, AVFStringDictParser {
    public typealias ModelType = Model
    public typealias Configurator = Config
    
    public fileprivate (set) var meta: [String : String] = [:]
    public fileprivate (set) var objects: [Model] = []
    
    public init(configurator: Configurator, data: Data) throws {
        let json: [String: Any?] = try processJSON(from: data)
        let metaDict: [String: String] = try parse(key: configurator.metaKey, from: json)
        let objectsDict: [String: [String: String]] = try parse(key: configurator.objectsKey, from: json)
        let timeZoneId: String = try parse(key: configurator.timeZoneKey, from: metaDict)
        // seems like it's always est but just to be sure
        let timeZone = TimeZone(identifier: timeZoneId) ?? TimeZone(abbreviation: "EST")!
        var objects: [Model] = []
        for objectDict in objectsDict {
            
            do {
                let dateStr = objectDict.key
                let date = try dateStr.dateValue(dateFormat: configurator.dateFormat, timeZone: timeZone)
                let model = try Model(date: date, dict: objectDict.value)
//                let model = try Model(dateString: objectDict.key, timeZone: timeZone, dict: objectDict.value)
                objects.append(model)
            } catch {
                // TODO: either throw and fail or return empty object array
                continue
            }
        }
        self.meta = metaDict
        self.objects = objects
    }
}
