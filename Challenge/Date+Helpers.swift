//
//  Date+Helpers.swift
//  playingWithTahada
//
//  Created by Hasna Ahmed on 14/05/1445 AH.
//

import Foundation



extension Date {
    func descriptiveString(dateStyle : DateFormatter.Style = .short) -> String{
        
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.locale = Locale(identifier: "ar")
        
        let daysBetween = self.daysBetween(date : Date())
        
        if daysBetween == 0 {
            return "اليوم"
        } else if daysBetween == 1 {
            return "أمس"
        } else {
            if daysBetween < 5 {
                let weekdayIndex = Calendar.current.component(.weekday, from: self ) - 1
                return formatter.weekdaySymbols[weekdayIndex]
            }
            return formatter.string(from: self )
        }
        
//        return "Today"
    }
    
    
    func daysBetween(date : Date) -> Int {
        let calender = Calendar.current
        let date1 = calender.startOfDay(for: self)
        let date2 = calender.startOfDay(for: date)
        if let daysBetween = calender.dateComponents([.day], from: date1, to: date2).day {
            return daysBetween
        }
        return 0
        
    }
    
}
