//
//  RedisInteractable.swift
//  POC_RedisCruding
//
//  Created by Caio Soares on 11/02/23.
//

import Foundation
import SwiftRedis

class RedisInteractable {
    
    var redis = Redis()
    
    func startService() {
        redis.connect(host: "localhost", port: 6379) {
            (redisError: NSError?) in
            if let error = redisError{
                print(error)
            } else {
                print("connected to redis.")
            }
        }
    }
    
    func setVal(_ value: String) {
        startService()
        redis.set("default", value: value) {
            (result: Bool, redisError: NSError?) in
            if let error = redisError {
                print(error)
            } else {
                print("value was set")
            }
        }
    }
    
    func fetchVal() -> String {
        var redisResponse = ""
        
        startService()
        redis.get("default") {
            (redisRes: RedisString?, redisError: NSError?) in
            if let error = redisError {
                print(error)
            } else {
                print("value was fetched")
                redisResponse = redisRes!.asString
            }
        }
        
        return redisResponse
    }
    
    
}
