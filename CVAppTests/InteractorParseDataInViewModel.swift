//
//  InteractorParseDataInViewModel.swift
//  CVAppTests

import XCTest
@testable import CVApp

class InteractorParseDataInViewModel: XCTestCase {

  // MARK: - Test functions
  func testExample() {
    let interactor = CVInteractor()
    let data = CVData(name: "Mark",
                      summary: "developer",
                      summaryQualifications: "Swift",
                      languages: "Spanish",
                      carrer: [Jobs(name: "CVApp",
                                    position: "Dev",
                                    seniority: "Senior",
                                    description: "Make apps")])
    XCTAssertNotNil(interactor.didGetCVDataFromService(cvData: data))
  }
}
