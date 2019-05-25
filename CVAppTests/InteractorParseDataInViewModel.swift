//
//  InteractorParseDataInViewModel.swift
//  CVAppTests

import XCTest
@testable import CVApp

class InteractorParseDataInViewModel: XCTestCase {

  // MARK: - Test functions
  func testExample() {
    let interactor = CVInteractor()
    let data = CVData(name: "kevin",
                      summary: "developer",
                      summaryQualifications: "Swift",
                      languages: "Spanish",
                      carrer: [Jobs(name: "Citi",
                                    position: "Dev",
                                    seniority: "Jr",
                                    description: "Make apps")])
    XCTAssertNotNil(interactor.didGetCVDataFromService(cvData: data))
  }
}
