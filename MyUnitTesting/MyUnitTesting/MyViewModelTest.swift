//
//  MyViewModelTest.swift
//  MyUnitTestingTests
//
//  Created by terry on 2022/7/4.
//

import XCTest
@testable import MyUnitTesting

class MyViewModelTest: XCTestCase {
    
    var viewModel: MyViewModel?
    
    override func setUpWithError() throws {
        viewModel = MyViewModel(isGray: Bool.random())
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testMyViewModel_init_isGray_shouldBeTrue() {
        // Given
        let isGray = true
        
        // When
        
        let vm = MyViewModel(isGray: isGray)
        
        // Then
        XCTAssertTrue(vm.isGray)
    }
    
    func testMyViewModel_init_isGray_shouldBeFalse() {
        // Given
        let isGray = false
        
        // When
        let vm = MyViewModel(isGray: isGray)
        
        // Then
        XCTAssertFalse(vm.isGray)
    }
    
    func testMyViewModel_getInfo_canGetResult() {
        // Given
        guard let vm = viewModel else {
            XCTFail()
            return
        }
        
        // When
        vm.getInfo()
        
        // Then
        XCTAssertNotNil(vm.currentPerson)
        XCTAssertGreaterThan(vm.currentPerson.recordList.count, 0)
    }
    
    
    func testMyViewModel_getInfo_RecordIsEmpty() {
        // Given
        guard let vm = viewModel else {
            XCTFail()
            return
        }
        
        // When
        vm.tempPerson.recordList = []
        vm.getInfo()
        
        
        // Then
        XCTAssertNotNil(vm.currentPerson)
        XCTAssertEqual(vm.currentPerson.latestDate, "N/A")
    }
    
    func testMyViewModel_getInfo_phoneIsEmpty() {
        // Given
        guard let vm = viewModel else {
            XCTFail()
            return
        }
        
        // When
        vm.tempPerson.phone = ""
        vm.getInfo()
        
        
        // Then
        XCTAssertNotNil(vm.currentPerson)
        XCTAssertEqual(vm.currentPerson.phone, "N/A")
    }
    
    func testMyViewModel_getInfo_phoneIsNil() {
        // Given
        guard let vm = viewModel else {
            XCTFail()
            return
        }
        
        // When
        vm.tempPerson.phone = nil
        vm.getInfo()
        
        
        // Then
        XCTAssertNotNil(vm.currentPerson)
        XCTAssertEqual(vm.currentPerson.phone, "N/A")
    }
    
    func testMyViewModel_resetInfo_canResetSuccessful() {
        // Given
        guard let vm = viewModel else {
            XCTFail()
            return
        }
        
        // When
        vm.resetInfo()
        
        // Then
        XCTAssertEqual(vm.currentPerson.name, "-")
    }
    
    func testMyViewModel_getLatestRecordDate_canGetSuccessful() {
        // Given
        guard let vm = viewModel else {
            XCTFail()
            return
        }
        
        // When
        vm.getInfo()
        
        // Then
        XCTAssertEqual(vm.currentPerson.latestDate, "2022/07/04")
    }
    
    func testMyViewModel_getLatestRecordDate_showNA() {
        // Given
        guard let vm = viewModel else {
            XCTFail()
            return
        }
        
        // When
        vm.getInfo()
        
        
        // Then
        XCTAssertEqual(vm.currentPerson.latestDate, "2022/07/04")
    }
    


}
