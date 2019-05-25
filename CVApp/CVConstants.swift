//
//  CVConstants.swift
//  CVApp

import Foundation

struct CVConstants {
  static let name = "Name"
  static let sumary = "Summary"
  static let summaryQualifications = "Summary Qualifications"
  static let languages = "Languages"
  static let carrer = "Carrer history"

  static let dataError = "Fail to get data"
  static let connectionError = "Connection error"
  static let decodingError = "Failed to decode"
  static let alertOk = "OK"

  static let infoPlistName = "Info"
  static let infoPlistType = "plist"
}


// MARK: - ResumeURL enumeration
/// The enumeration to test the profile behavior
enum ResumeURL: String {
  case success = "ResumeUrlGood"
  case invalid = "ResumeUrlBad"
  case noSections = "ResumeUrlBadJson"
}
