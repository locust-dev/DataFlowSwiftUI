//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 08.06.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @AppStorage("isRegistered") var isRegistered = false
    @AppStorage("username") var name = ""
    
    var body: some View {
        VStack {
            Text("Hi, \(name)!")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            Spacer()
            VStack(spacing: 30) {
                TimerButton(timer: timer)
                LogOutButton(isRegistered: $isRegistered, name: $name)
            }
            Spacer()
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
