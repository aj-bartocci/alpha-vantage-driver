//
//  AlphaVantage.swift
//  AlphaVantageDriver
//
//  Created by AJ Bartocci on 10/27/17.
//

import Foundation

public struct AlphaVantage {
    fileprivate let apiErrorMessage = "API key has not been set. You must call AlphaVantage.setup(with apiKey) before attempting to make any calls. Typically set during app launch"
    fileprivate var apiKey: String?
    fileprivate var session: URLSession?
    public static var shared = AlphaVantage()
    
    fileprivate init() { }
    public init(apiKey: String, session: URLSession) {
        self.apiKey = apiKey
        self.session = session
    }
    
    public lazy var timeSeries: TimeSeriesWrapper = {
        var series = TimeSeriesWrapper(errorMessage: self.apiErrorMessage)
        series.apiKey = self.apiKey
        return series
    }()
}

public struct TimeSeriesWrapper {
    fileprivate var apiKey: String?
    private let apiErrorMessage: String
    fileprivate init(errorMessage: String) {
        self.apiErrorMessage = errorMessage
    }
    /// Provides calls to get JSON or IntraDayModel responses
    public lazy var intraDay: AVFIntraDayWorker = {
        guard let key = self.apiKey else {
            fatalError(self.apiErrorMessage)
        }
        return AVFIntraDayWorker(apiKey: key)
    }()
    /// Provides calls to get JSON or DailyModel responses
    public lazy var daily: AVFNonIntervalWorker<AVFDailyConfig> = {
        guard let key = self.apiKey else {
            fatalError(self.apiErrorMessage)
        }
        return AVFNonIntervalWorker<AVFDailyConfig>(apiKey: key)
    }()
    /// Provides calls to get JSON or DailyAdjustedModel responses
    public lazy var dailyAdjusted: AVFNonIntervalWorker<AVFDailyAdjustedConfig> = {
        guard let key = self.apiKey else {
            fatalError(self.apiErrorMessage)
        }
        return AVFNonIntervalWorker<AVFDailyAdjustedConfig>(apiKey: key)
    }()
    /// Provides calls to get JSON or WeeklyModel responses
    public lazy var weekly: AVFNonIntervalWorker<AVFWeeklyConfig> = {
        guard let key = self.apiKey else {
            fatalError(self.apiErrorMessage)
        }
        return AVFNonIntervalWorker<AVFWeeklyConfig>(apiKey: key)
    }()
    /// Provides calls to get JSON or WeeklyAdjustedModel responses
    public lazy var weeklyAdjusted: AVFNonIntervalWorker<AVFWeeklyAdjustedConfig> = {
        guard let key = self.apiKey else {
            fatalError(self.apiErrorMessage)
        }
        return AVFNonIntervalWorker<AVFWeeklyAdjustedConfig>(apiKey: key)
    }()
    /// Provides calls to get JSON or MonthlyModel responses
    public lazy var monthly: AVFNonIntervalWorker<AVFMonthlyConfig> = {
        guard let key = self.apiKey else {
            fatalError(self.apiErrorMessage)
        }
        return AVFNonIntervalWorker<AVFMonthlyConfig>(apiKey: key)
    }()
    /// Provides calls to get JSON or MonthlyAdjustedModel responses
    public lazy var monthlyAdjusted: AVFNonIntervalWorker<AVFMonthlyAdjustedConfig> = {
        guard let key = self.apiKey else {
            fatalError(self.apiErrorMessage)
        }
        return AVFNonIntervalWorker<AVFMonthlyAdjustedConfig>(apiKey: key)
    }()
}
