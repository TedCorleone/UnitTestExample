//
//  PersonModel.swift
//  MyUnitTesting
//
//  Created by terry on 2022/7/4.
//

import Foundation

struct PersonModel {
    var name: String?
    var phone: String?
    var location: String?
    var latestDate: String?
    var recordList: [Record]
}

struct Record: Hashable {
    var id = UUID()
    var date: String?
    var isActive: Bool
}
