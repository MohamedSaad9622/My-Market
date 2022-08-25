//
//  GetCurrentTime.swift
//  My Market
//
//  Created by MAC on 25/08/2022.
//

import Foundation

func getCurrentTime() -> String {
    let today = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
    let result = dateFormatter.string(from: today)
    return result
}
