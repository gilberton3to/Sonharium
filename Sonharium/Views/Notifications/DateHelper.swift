//
//  DateHelper.swift
//  Sonharium
//
//  Created by Gilberto Neto on 20/06/24.
//

import Foundation

struct DateHelper {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
}
