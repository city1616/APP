import UIKit
import SwiftUI

var str = "Hello, playground"
print(str)

let currentDate = Date()

let oneMinuteFromNow = Date.init(timeIntervalSinceNow: 60)

let oldDate = Date.init(timeIntervalSinceReferenceDate: 3600)

let dateFormatter = DateFormatter()

dateFormatter.dateStyle = .full
dateFormatter.timeStyle = .full
print(dateFormatter.string(from: currentDate))

