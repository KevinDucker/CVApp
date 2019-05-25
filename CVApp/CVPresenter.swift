//
//  CVPresenter.swift
//  CVApp

import Foundation
import UIKit

class CVPresenter {

  // MARK: Properties
  var view: CVPresenterToViewProtocol?
  var interactor: CVPresenterToInteractorProtocol?
  var router: CVPresenterToRouterProtocol?
  var viewController: ViewController?
  var elements: [CVViewModelProtocol] = []

}

// MARK: CVViewToPresenterProtocol implementation
extension CVPresenter: CVViewToPresenterProtocol {

  /**
   * Initial load for the ViewController
   - Parameter from: The current ViewController.
   **/

  func initialLoad(from viewController: ViewController) {
    self.viewController = viewController
    interactor?.getCVData()
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
}

// MARK: CVInteractorToPresenterProtocol implementation
extension CVPresenter: CVInteractorToPresenterProtocol {
  func didGetData(model: [CVViewModel]) {
    elements = model
    self.view?.updateView(entities: elements)
  }
}
