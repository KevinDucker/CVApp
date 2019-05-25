//
//  CVModels.swift
//  CVApp
//
//  Created by Kevin Ducker Marin on 5/24/19.
//  Copyright © 2019 Kevin Ducker Marin. All rights reserved.
//

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
//enum Levels {
//  case basic
//  case intermediate
//  case advanced
//}
//
//struct Quialifications: Codable {
//  let name: String
//  let level: String
//}
//
//struct Languages: Codable {
//  let name: String
//  let level: String
//}

//struct Jobs: Codable {
//  let name: String
//  let position: String
//  let seniority: String
//  let description: [JobDescriptions]
//}
//
//struct JobDescriptions: Codable {
//  let projectName: String
//  let projectDescription: String
//}

//enum Seniority {
//  case junior
//  case juniorAdvanced
//  case semisenior
//  case semiseniorAdvanced
//  case senior
//  case seniorAdvanced
//}
