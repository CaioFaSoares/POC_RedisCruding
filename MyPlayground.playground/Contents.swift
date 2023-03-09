import Foundation
import RediStack
import NIO

let eventLoop: EventLoop = ...
let connection = RedisConnection.make(
    configuration: .init(hostname: "localhost"),
    boundEventLoop: eventLoop
).wait()

let result = try connection.set("my_key", to: "some value")
    .flatMap { return connection.get("my_key") }
    .wait()

print(result) // Optional("some value")
