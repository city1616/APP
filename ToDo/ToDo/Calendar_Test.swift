//
//  Calendar_Test.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/08/22.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI
import FSCalendar
import UIKit

struct Calendar_Test: View {
    
    
    
    var body: some View {
        cal_Test()
        
    }
}

struct Calendar_Test_Previews: PreviewProvider {
    static var previews: some View {
        Calendar_Test()
    }
}

struct cal_Test: UIViewRepresentable {
    
    
    fileprivate weak var calendar: FSCalendar!
    
    
//    calendar.dataSource = self
//    calendar.delegate = self
//    view.addSubview(calendar)
//    self.calendar = calendar
    
//    return view
    
    func makeUIView(context: UIViewRepresentableContext<cal_Test>) -> UIView {
        let view = UIView(frame: UIScreen.main.bounds)
//        let height: CGFloat = UIDevice.current.model.hasPrefix("iPad") ? 400 : 300
//        let width = view.frame.size.width
//        let frame = CGRect(x: 0.0, y: 0.0, width: width, height: height)
        let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
        // let calendar = FSCalendar(frame: frame)
        calendar.locale = Locale.init(identifier: "KO-ko")
        calendar.delegate = context.coordinator
        context.coordinator.fsCalendar = calendar
        calendar.backgroundColor = UIColor(Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)))
        calendar.scrollDirection = .vertical

        view.addSubview(calendar)
//            .frame(width: view.frame.size.width, height: 150)
        
        return view
    }
//    func makeCoordinator() -> CalendarView.Coordinator {
//        Coordinator(self)
//    }
//    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<CalendarView>) {
//        context.coordinator.fsCalendar?.select(date)
//    }
    class Coordinator: NSObject, FSCalendarDataSource, FSCalendarDelegate {
        
        fileprivate let gregorian: NSCalendar! = NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)
        
        weak var calendar: FSCalendar!
        // self.calendar.apperance.headerTitleColor = UIColor.red
        var control: CalendarView
        var date: Date
        var fsCalendar: FSCalendar?
        init(_ control: CalendarView) {
            self.control = control
            self.date = control.date
        }
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            self.control.date = date
        }
//        func calendar(calendar: FSCalendar!, hasEventForDate date: NSDate!) -> Bool {
//            return shouldShowEventDot
//        }
        func calendar(_ calendar: FSCalendar, imageFor date: Date) -> Image? {
            let day: Int! = self.gregorian.component(.day, from: date)
            return [13].contains(day) ? Image(systemName: "pencil") : nil
        }
        func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
            let day: Int! = self.gregorian.component(.day, from: date)
            return day % 5 == 0 ? day/5 : 0
        }
        func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
            return "abc"
        }
        func calendar(calendar: FSCalendar!, hasEventForDate date: NSDate!) -> Bool {
            return true
        }
    }
}
