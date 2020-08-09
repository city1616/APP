//
//  test.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/08/03.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI
import Foundation
import UIKit
import FSCalendar

struct test: View {
//
//    @Binding var version: String
    @State var input = ""
    @State var date = Date()
//    @Binding var date: Date
//    var title: String
//
//    @State private var showVersionPicker = false
//    @State private var showDatePicker = false
//
//    var dateFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd"
//        return formatter
//    }
//    private func showDate() {
//        showDatePicker = true
//    }
    
    var body: some View {
        Text("a")
        
//            HStack(alignment: .center) {
//                Text("Test")
//                    .font(.system(size: 14))
//
//                HStack(alignment: .center) {
//                    TextField("empty", text: $input)//  {
////                        self.version = self.input
////                    }
//                    .font(.system(size: 9))
//                    .padding(.leading, 20)
//                    .frame(width: 100, height: 20)
//
//                    NavigationLink(destination: EmptyView()) {
//                        Image(systemName: "line.horizontal.3")
//                            .frame(width: 24, height: 14)
//                            .aspectRatio(contentMode: .fill)
//                    }
//                    .offset(x: -20)
//
//                }
//                .frame(width: 100, height: 25)
//                .border(Color.gray, width: 0.5)
//                .padding(.leading, 40)
//
//                NavigationLink(destination: EmptyView()) {
//                    HStack {
////                        Text(dateFormatter.string(from: date))
////                            .font(.system(size: 9))
////                            .padding(.leading, 10)
//                        Image(systemName: "gear")
//                    }
//                    .frame(width: 100, height: 25)
//                    .border(Color.gray, width: 0.5)
//                    .padding(.leading, 40)
//                }
//
//
//            }
//            .padding(.bottom.10)
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        CalendarViewTest(date: .constant(Date()))
    }
}

struct CalendarViewTest : UIViewRepresentable {


    @Environment(\.presentationMode) var presentationMode

    @Binding var date: Date

    init(date: Binding<Date>) {
    self._date = date

    }

    func makeUIView(context: UIViewRepresentableContext<CalendarViewTest>) -> UIView {
    let view = UIView(frame: UIScreen.main.bounds)
            // view.backgroundColor = .backgroundTheme

    let height: CGFloat = 300.0
    let width = view.frame.size.width
    let frame = CGRect(x: 0.0, y: 0.0, width: width, height: height)
    let calendar = FSCalendar(frame: frame)
            calendar.locale = Locale.init(identifier: "ZH-CN")
            calendar.delegate = context.coordinator
            context.coordinator.fsCalendar = calendar
            calendar.backgroundColor = UIColor.white
            view.addSubview(calendar)

    return view
        }

    func makeCoordinator() -> CalendarViewTest.Coordinator {
    Coordinator(self)
        }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<CalendarViewTest>) {
            // log.debug("Date")


            context.coordinator.fsCalendar?.select(date)

        }


    func dismiss() {
            presentationMode.wrappedValue.dismiss()
        }

    class Coordinator: NSObject, FSCalendarDelegate {
    var control: CalendarViewTest
    var date: Date
    var fsCalendar: FSCalendar?
    init(_ control: CalendarViewTest) {
        self.control = control
        self.date = control.date
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.control.date = date
        }

    }
}
