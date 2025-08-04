//
//  LogManager.swift
//  Genie
//
//  Created by Shalini K P on 04/08/2025.
//

import os.log
import Foundation

protocol Logging {
    func log(_ message: String)
    func error(_ message: String)
    func info(_ message: String)
    func fault(_ message: String)
    func debug(_ message: String)
}

final public class LogManager: Logging {
    
    let logger: Logger
    public static let shared = LogManager()
    
    public init(_ logger: Logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "Genie", category: "Default")) {
        self.logger = logger
    }
    
    private func logMessage(_ message: String, level: OSLogType) {
        guard #available(iOS 14.0, *) else {
            NSLog("%@", message) // Logger supports only iOS 14 & above
            return
        }
        
        switch level {
        case .info:
            logger.info("\(message, privacy: .public)")
        case .error:
            logger.error("\(message, privacy: .public)")
        case .fault:
            logger.fault("\(message, privacy: .public)")
        case .debug:
            logger.debug("\(message, privacy: .public)")
        default:
            logger.log("\(message, privacy: .public)")
        }
    }
    
    public func log(_ message: String) {
        logMessage("[LOG] \(message)", level: .default)
    }
    
    public func error(_ message: String) {
        logMessage("[ERROR] \(message)", level: .error)
    }
    
    public func info(_ message: String) {
        logMessage("[INFO] \(message)", level: .info)
    }
    
    public func fault(_ message: String) {
        logMessage("[FAULT] \(message)", level: .fault)
    }
    
    public func debug(_ message: String) {
        logMessage("[DEBUG] \(message)", level: .debug)
    }
}
