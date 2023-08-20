//
//  DateFormatter+Extension.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 09/08/23.
//

import Foundation

extension DateFormatter {
    static let shared = DateFormatter()

    static func formattedTimeString(from dateTime: String, inputDateFormat: String, outputDateFormat: String) -> String {
        shared.dateFormat = inputDateFormat
        
        if let date = shared.date(from: dateTime) {
            shared.dateFormat = outputDateFormat
            
            let formattedDateString = shared.string(from: date)
            
            return formattedDateString
        } else {
            return "Invalid date"
        }
    }
}

