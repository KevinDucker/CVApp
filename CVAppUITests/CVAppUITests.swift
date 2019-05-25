//
//  CVAppUITests.swift
//  CVAppUITests
//
//  Created by Kevin Ducker Marin on 5/25/19.
//  Copyright © 2019 Kevin Ducker Marin. All rights reserved.
//

import XCTest

class CVAppUITests: XCTestCase {

  // MARK: - Attributes
  let app = XCUIApplication()

  // MARK: - Super class methods
  override func setUp() {
    continueAfterFailure = false
    app.launch()
  }

  // MARK: - Tests methods
  func testMinimumSections() {
    XCTAssertTrue(app.tables.staticTexts["Name"].exists)
    XCTAssertTrue(app.tables.staticTexts["Summary"].exists)
    XCTAssertTrue(app.tables.staticTexts["Summary Qualifications"].exists)
    XCTAssertTrue(app.tables.staticTexts["Languages"].exists)
    XCTAssertTrue(app.tables.staticTexts["Carrer history"].exists)
  }

  func testMinimumCellsCount() {
    let numberOfCells = app.tables.cells.count
    XCTAssertGreaterThanOrEqual(numberOfCells, 3)
  }

}
