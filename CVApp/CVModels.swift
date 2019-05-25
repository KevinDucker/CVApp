//
//  CVModels.swift
//  CVApp

import Foundation
import UIKit

struct CVData: Codable {
  let name: String
  let summary: String
  let summaryQualifications: String
  let languages: String
  let carrer: [Jobs]
}

struct Jobs: Codable {
  let name: String
  let position: String
  let seniority: String
  let description: String
}
