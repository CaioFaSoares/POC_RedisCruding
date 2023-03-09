//
//  ContentView.swift
//  POC_RedisCruding
//
//  Created by Caio Soares on 10/02/23.
//

import SwiftUI

struct ContentView: View {
    
    let redis = RedisInteractable()
    @State var redisValue = " "
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(redisValue)
            Text("Hello, Redis!")
            Button("Connect to Redis", action: {
                Task{
                    redis.startService()
                }
            })
            Button("Connect to Redis and set value", action: {
                Task{
                    redis.setVal("Hi, this value came from Redis!")
                }
            })
            Button("Fecth value from Redis", action: {
                Task{
                    redisValue = redis.fetchVal()
                }
            })
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
