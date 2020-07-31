//
//  TabViewTest.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/31.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI

struct TabViewTest: View {
    
    @State var index = 0
    //Swiftui 2.0
    // var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    
    var body: some View {
        VStack {
            HStack {
                Text("STAT")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                Spacer(minLength: 0)
            }
            .padding(.horizontal)
            
            // Tab View
            HStack(spacing: 0) {
                Text("Day")
                    .foregroundColor(self.index == 0 ? .white : Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)).opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)).opacity(self.index == 0 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        self.index = 0
                    }
                
                Spacer(minLength: 0)
                
                Text("Week")
                    .foregroundColor(self.index == 1 ? .white : Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)).opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)).opacity(self.index == 1 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        self.index = 1
                    }
                
                Spacer(minLength: 0)
                
                Text("Month")
                    .foregroundColor(self.index == 2 ? .white : Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)).opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)).opacity(self.index == 2 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        self.index = 2
                    }
            }
            .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.06))
            .clipShape(Capsule())
            .padding(.horizontal)
            .padding(.top, 25)
            
            // DashBoard Grid
            // SwiftUI 2.0
            // LazyVGrid(columns)
            
            Spacer(minLength: 0)
        }
        .padding(.top)
    }
}

struct TabViewTest_Previews: PreviewProvider {
    static var previews: some View {
        TabViewTest()
    }
}

struct Fitness: Identifiable {
    var id: Int
    var title: String
    var image: String
    var data: String
    var suggest: String
}

// Daily Data
var fit_Data = [
    Fitness(id: 0, title: "Heart Rate", image: "", data: "124 bpm", suggest: "80-120\nHealthy"),
    Fitness(id: 1, title: "Sleep", image: "", data: "6h 43m", suggest: "Deep Sleep\n5h 13m"),
    Fitness(id: 2, title: "Energy Burn", image: "", data: "583 kcal", suggest: "Daily Goal\n900 kcal"),
    Fitness(id: 3, title: "Steps", image: "", data: "16,742", suggest: "Daily Goal\n20,000 Steps"),
    Fitness(id: 4, title: "Running", image: "", data: "5.3 km", suggest: "Daily Goal\n10 km"),
    Fitness(id: 5, title: "Cycling", image: "", data: "15.3 km", suggest: "Daily Goal\n20 km")
]

// Monthly Data
var week_Fit_Data = [
    Fitness(id: 0, title: "Heart Rate", image: "", data: "124 bpm", suggest: "80-120\nHealthy"),
    Fitness(id: 1, title: "Sleep", image: "", data: "6h 43m", suggest: "Deep Sleep\n5h 13m"),
    Fitness(id: 2, title: "Energy Burn", image: "", data: "583 kcal", suggest: "Daily Goal\n900 kcal"),
    Fitness(id: 3, title: "Steps", image: "", data: "16,742", suggest: "Daily Goal\n20,000 Steps"),
    Fitness(id: 4, title: "Running", image: "", data: "5.3 km", suggest: "Daily Goal\n10 km"),
    Fitness(id: 5, title: "Cycling", image: "", data: "15.3 km", suggest: "Daily Goal\n20 km")
]
