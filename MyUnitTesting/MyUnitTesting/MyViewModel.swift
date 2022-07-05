//
//  MyViewModel.swift
//  MyUnitTesting
//
//  Created by terry on 2022/7/4.
//

import Foundation


class MyViewModel: ObservableObject {
    @Published var isGray: Bool
    @Published var currentPerson: PersonModel
    
    var tempPerson: PersonModel = PersonModel(name: "张三",
                                                     phone: "15998765432",
                                                     location: "大连",
                                                     latestDate: "",
                                                     recordList: [Record(date: "2022/03/04", isActive: true),
                                                                             Record(date: "2022/04/04", isActive: false),
                                                                             Record(date: "2022/05/04", isActive: false),
                                                                             Record(date: "2022/06/04", isActive: false),
                                                                             Record(date: "2022/07/04", isActive: false)])
    
    init(isGray: Bool) {
        self.isGray = isGray
        self.currentPerson = PersonModel(name: "-", phone: "-", location: "-", latestDate: "-", recordList: [])
    }
    
    func getInfo() {
        self.currentPerson = PersonModel(name: tempPerson.name,
                                         phone: maskPhone(phone: tempPerson.phone ?? "-"),
                                         location: tempPerson.location,
                                         latestDate: getLatestRecordDate(recordList: tempPerson.recordList),
                                         recordList: tempPerson.recordList)
    }
    
    func resetInfo() {
        self.currentPerson = PersonModel(name: "-", phone: "-", location: "-", latestDate: "-", recordList: [])
    }
    
    private func maskPhone(phone: String) -> String {
        var currentPhone = phone
        guard currentPhone.count == 11 else {
            return "N/A"
        }
        let startIndex = currentPhone.index(currentPhone.startIndex, offsetBy:3)
        let endIndex = currentPhone.index(currentPhone.startIndex, offsetBy:6)
        currentPhone.replaceSubrange(startIndex...endIndex, with: "****")
        
        return currentPhone
    }
    
    private func getLatestRecordDate(recordList: [Record]) -> String {
        return recordList.last?.date ?? "N/A"
    }
}
