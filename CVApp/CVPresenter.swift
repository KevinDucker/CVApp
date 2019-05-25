//
//  CVPresenter.swift
//  CVApp
//
//  Created by Kevin Ducker Marin on 5/24/19.
//  Copyright © 2019 Kevin Ducker Marin. All rights reserved.
//

import Foundation
import UIKit

class CVPresenter {

  // MARK: Properties
  var view: CVPresenterToViewProtocol?
  var interactor: CVPresenterToInteractorProtocol?
  var router: CVPresenterToRouterProtocol?
  var viewController: ViewController?
  var elements: [CVViewModelProtocol] = []

  private func loadInvesmentsList() -> [CVViewModelProtocol] {
    return [CVViewModel(image: "", title: ""),
            CVViewModel(image: "", title: ""),
            CVViewModel(image: "", title: "")
    ]
  }

}

extension CVPresenter: CVViewToPresenterProtocol {

  /**
   * Initial load for the ViewController
   - Parameter from: The current ViewController.
   **/

  func initialLoad(from viewController: ViewController) {
    self.viewController = viewController
//    self.elements = self.loadInvesmentsList()
    interactor?.getCVData()
    self.view?.updateView(entities: elements)
  }

  /*
   Configure the cell according with the data received
   - parameters:
   - cell: The cell to be configured
   - cellText: The text to be shown in the cell
   */
  func configureCell(cell: UITableViewCell, element: CVViewModelProtocol) {
    switch cell {
    case let newCell as CVCellTitle:
      newCell.configure(element: element)
    default:
      break
    }
  }

  /*
   Pop ViewController
   */
  func popViewController() {
    guard let currentView = viewController else { return }
    router?.popViewController(from: currentView)
  }
}

extension CVPresenter: CVInteractorToPresenterProtocol {
  func didGetData() {
  }
}
