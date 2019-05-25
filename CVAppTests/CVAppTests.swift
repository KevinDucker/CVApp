//
//  CVAppTests.swift
//  CVAppTests

import XCTest
@testable import CVApp

class CVAppConnectionTests: XCTestCase {

  // MARK: - Test functions
  func test_loadCVData() {
   let connectionHelper = CVConnectionHelper()
    XCTAssertNotNil(connectionHelper.loadCVData())
  }
}
