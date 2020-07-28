//
//  SecondView.swift
//  SwiftUIDemo
//
//  Created by SeungWoo Mun on 2020/07/28.
//

import SwiftUI

struct SecondView: View {
//    @ObservedObject var timerData: TimerData
    @EnvironmentObject var timerData: TimerData
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
            Text("Timer Count = \(timerData.timeCount)")
                .font(.headline)
        }
        .padding()
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView().environmentObject(TimerData())
    }
}
