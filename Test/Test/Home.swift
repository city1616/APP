//
//  Home.swift
//  Test
//
//  Created by SeungWoo Mun on 2020/07/31.
//

import SwiftUI

struct Home: View {
    
    @State var index = 0
    
    var body: some View {
        VStack {
            HStack {
                Text("STAT")
                    .font(.title)
                    .fontWeight(.bold)
                    // .foregroundColor(Color("Color"))
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal)
            
            // Tab View
            HStack(spacing: 0) {
                Text("Day")
            }
            
            Spacer(minLength: 0)
        }
        .padding(.top)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
