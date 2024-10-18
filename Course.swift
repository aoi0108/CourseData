//
//  Course.swift
//  CourseData
//
//  Created by 平松蒼惟 on 2024/10/18.
//

import Foundation

struct Course : Identifiable, Codable{
    var id: Int
    var image: String
    var title: String
    var subtitle: String
}
