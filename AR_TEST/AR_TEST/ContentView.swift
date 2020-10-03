//
//  ContentView.swift
//  AR_TEST
//
//  Created by SeungWoo Mun on 2020/10/01.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    @EnvironmentObject var data: DataModel
    
    @State var ShowMenu = false

    var body: some View {
        NavigationView {
            ZStack {
                if data.enableAR {
                    ARDisplayView()
                }
                else {
                    VStack {
                        Text("AR Enable")
                        Spacer()
                    }
                }
                if self.ShowMenu {
                    VStack(alignment:.leading) {
                        ARUIView()
                        Spacer()
                        Spacer()
                    }
                }
            }
//            if self.ShowMenu {
//                HStack {
//                    ARUIView()
//                    if data.enableAR {
//                        ARDisplayView()
//                    }
//                    else {
//                        Spacer()
//                    }
//                }
//            }
            .navigationTitle("AR_TEST")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {
                withAnimation {
                    self.ShowMenu.toggle()
                }
            }) {
                Text("AR")
            })
        }
        .edgesIgnoringSafeArea(.all)
        
//        HStack {
//            ARUIView()
//            if data.enableAR {
//                ARDisplayView()
//            }
//            else {
//                Spacer()
//            }
//        }
        // return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
