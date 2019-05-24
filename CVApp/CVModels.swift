//
//  CVModels.swift
//  CVApp
//
//  Created by Kevin Ducker Marin on 5/24/19.
//  Copyright © 2019 Kevin Ducker Marin. All rights reserved.
//

import Foundation

struct CVData {
  let name: String
  let summary: String
  let summaryQualifications: [Quialifications]
  let languages: [Languages]
  let carrer: [Jobs]
}
enum Levels {
  case basic
  case intermediate
  case advanced
}

struct Quialifications {
  let name: String
  let level: Levels
}

struct Languages {
  let name: String
  let level: Levels
}

struct Jobs {
  let name: String
  let position: String
  let seniority: Seniority
  let description: [JobDescriptions]
}

struct JobDescriptions {
  let projectName: String
  let projectDescription: String
}

enum Seniority {
  case junior
  case juniorAdvanced
  case semisenior
  case semiseniorAdvanced
  case senior
  case seniorAdvanced
}
