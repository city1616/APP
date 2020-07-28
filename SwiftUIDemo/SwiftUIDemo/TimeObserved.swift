//
//  TimeObserved.swift
//  SwiftUIDemo
//
//  Created by SeungWoo Mun on 2020/07/28.
//

import SwiftUI

struct TimeObserved: View {
//    @ObservedObject var timerData: TimerData = TimerData()
    @EnvironmentObject var timerData: TimerData
    var body: some View {
        NavigationView {
            VStack {
                Text("Timer count = \(timerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Button(action: resetCount) {
                    Text("Reset Counter")
                }
                NavigationLink(
                    destination: SecondView()) {
                    Text("Next Screen")
                }
                .padding()
            }
        }
    }
    func resetCount() {
        timerData.resetCount()
    }
}

struct TimeObserved_Previews: PreviewProvider {
    static var previews: some View {
        TimeObserved().environmentObject(TimerData())
    }
}
