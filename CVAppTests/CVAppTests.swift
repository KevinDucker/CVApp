//
//  CVAppTests.swift
//  CVAppTests

import XCTest
@testable import CVApp

class CVAppConnectionTests: XCTestCase, CVAPIDataManagerToErrorHelperProtocol {

  let goodUrl = "https://gist.githubusercontent.com/KevinDucker/7e0656d0bfeb59d125ace3f07082db1d/raw/3e60b3d8a1178bd6f50d70a097c9379396476887/CVJson.json"
  let badJsonFileUrl = "https://gist.githubusercontent.com/KevinDucker/399a14a581f8f210a64ef0aa2fb320e1/raw/0076338093a108e63033cd9093ebe92e0acc58af/CVJsonBad"
  let badUrl = "https://gist.githubusercontent.com/KevinDucker//raw/CVJson.json"

  var view: CVErrorHelperToViewControllerProtocol?

  var expectation = XCTestExpectation()

  // MARK: - Test functions
  func test_loadCVData() {
    let connectionHelper = CVConnectionHelper(url: goodUrl)
    XCTAssertNotNil(connectionHelper.loadCVData())
  }

  func test_loadDataFail() {
    let connectionHelper = CVConnectionHelper(url: badJsonFileUrl)
    connectionHelper.errorHelper = self
    expectation = XCTestExpectation(description: CVErrorHelper.ErrorTypes.decodingError.rawValue)
    connectionHelper.loadCVData()
    wait(for: [expectation], timeout: 3.0)
  }

  func test_loadDataConnectionFail() {
    let connectionHelper = CVConnectionHelper(url: badUrl)
    connectionHelper.errorHelper = self
    expectation = XCTestExpectation(description: CVErrorHelper.ErrorTypes.connectionError.rawValue)
    connectionHelper.loadCVData()
    wait(for: [expectation], timeout: 3.0)
  }

  func didGetError(error: CVErrorHelper.ErrorTypes) {
    expectation.fulfill()
  }
}
