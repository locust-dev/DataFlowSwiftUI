//
//  Buttons.swift
//  StateAndDataFlow
//
//  Created by Илья Тюрин on 09.06.2021.
//

import SwiftUI

struct TimerButton: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        SomeButton(title: timer.buttonTitle,
                   color: .red,
                   closure: timer.startTimer)
    }
}
 

struct LogOutButton: View {
    @Binding var isRegistered: Bool
    @Binding var name: String
    
    var body: some View {
        SomeButton(title: "Log Out",
                   color: .blue,
                   closure: logOut)
    }
    
    private func logOut() {
        isRegistered = false
        name = ""
    }
}

struct SomeButton: View {
    let title: String
    let color: Color
    let closure: () -> Void
    
    var body: some View {
        Button(action: closure) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        SomeButton(title: "Some", color: .blue, closure: {})
    }
}
