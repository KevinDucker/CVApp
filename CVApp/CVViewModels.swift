//
//  CVViewModels.swift
//  CVApp

import Foundation

/**
 * View elements for cell.
 **/
struct CVViewModel: CVViewModelProtocol {
  var title: String
  var desc: String
}

/**
 * Protocol for cell models.
 **/
protocol CVViewModelProtocol {
  var title: String { get set }
  var desc: String { get set }
}
