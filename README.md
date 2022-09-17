# SwiftLoggingBindingForWorkflow

Binding to use a `LogHandler` according to [swift-log](https://github.com/apple/swift-log) as the base for a logger according to [SwiftWorkflow](https://github.com/stefanspringer1/SwiftWorkflow):

```Swift
let logger = SwiftLogger(logHandler: myLogHandler, closeFunction: { ... })
```

The message levels of SwiftWorkflow are then translated to the the best fitting log levels of swift-log.

The `closeFunction` argument (defaults to `nil`) is called when the logger is closed.
