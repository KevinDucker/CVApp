//
//  CVViewModels.swift
//  CVApp
//
//  Created by Kevin Ducker Marin on 5/24/19.
//  Copyright © 2019 Kevin Ducker Marin. All rights reserved.
//

import Foundation

/**
 * View elements for cell.
 **/
struct CVViewModel: CVViewModelProtocol {
  var image: String
  var title: String
}

/**
 * Protocol for cell models.
 **/
protocol CVViewModelProtocol {
  var title: String { get set }
  var image: String { get set }
}
