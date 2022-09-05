import Foundation
import Workflow
import Logging

public extension MessageType {
    
    /// translate into
    var swiftLogLevel: Logging.Logger.Level {
        switch self {
        case .Debug:
            return Logging.Logger.Level.debug
        case .Progress, .Info:
            return Logging.Logger.Level.info
        case .Warning:
            return Logging.Logger.Level.warning
        case .Iteration:
            return Logging.Logger.Level.info
        case .Error:
            return Logging.Logger.Level.error
        case .Fatal, .Deadly:
            return Logging.Logger.Level.critical
        }
    }
    
}

/// A logger using a logger according to swift-log in the background.
public actor SwiftLogger: Workflow.Logger {
    
    let logHandler: Logging.LogHandler
    let closeFunction: (() -> ())?
    
    public init(logHandler: Logging.LogHandler, closeFunction: (() -> ())? = nil) {
        self.logHandler = logHandler
        self.closeFunction = closeFunction
    }
    
    public func log(_ event: LoggingEvent) async {
        logHandler.log(
            level: event.type.swiftLogLevel,
            message: Logging.Logger.Message(
                stringLiteral: event.fact[.en] ?? event.fact.description
                    + " (" + event.effectuationIDStackDescription + ")"
            ),
            metadata: nil,
            source: event.itemPositionInfo ?? "?",
            file: event.itemInfo ?? "?",
            function: event.effectuationIDStackDescription,
            line: 0)
    }
    
    public func close() async throws {
        closeFunction?()
    }
    
}
