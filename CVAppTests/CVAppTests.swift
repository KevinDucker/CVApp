//
//  CVAppTests.swift
//  CVAppTests

import XCTest
@testable import CVApp

class CVAppConnectionTests: XCTestCase, CVAPIDataManagerToErrorHelperProtocol {

  // MARK: - Variables
  var view: CVErrorHelperToViewControllerProtocol?
  var expectation = XCTestExpectation()

  // MARK: - Test functions
  func test_loadCVData() {
    let connectionHelper = CVConnectionHelper(url: ResumeURL.success.rawValue)
    XCTAssertNotNil(connectionHelper.loadCVData())
  }

  func test_loadDataFail() {
    let connectionHelper = CVConnectionHelper(url: ResumeURL.noSections.rawValue)
    connectionHelper.errorHelper = self
    expectation = XCTestExpectation(description: CVErrorHelper.ErrorTypes.decodingError.rawValue)
    connectionHelper.loadCVData()
    wait(for: [expectation], timeout: 3.0)
  }

  func test_loadDataConnectionFail() {
    let connectionHelper = CVConnectionHelper(url: ResumeURL.invalid.rawValue)
    connectionHelper.errorHelper = self
    expectation = XCTestExpectation(description: CVErrorHelper.ErrorTypes.connectionError.rawValue)
    connectionHelper.loadCVData()
    wait(for: [expectation], timeout: 3.0)
  }

  func didGetError(error: CVErrorHelper.ErrorTypes) {
    expectation.fulfill()
  }
}
