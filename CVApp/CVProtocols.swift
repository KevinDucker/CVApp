//
//  CVProtocols.swift
//  CVApp

import Foundation
import UIKit

/**
 * ViewController -> Presenter
 **/
protocol CVViewToPresenterProtocol {
  var view: CVPresenterToViewProtocol? { get set }
  var interactor: CVPresenterToInteractorProtocol? { get set }
  var router: CVPresenterToRouterProtocol? { get set }
  var viewController: ViewController? { get set }
  func initialLoad(from viewController: ViewController)
  func configureCell(cell: UITableViewCell, element: CVViewModelProtocol)
}

/**
 * Presenter -> ViewController
 **/
protocol CVPresenterToViewProtocol {
  var presenter: CVViewToPresenterProtocol? { get set }
  func updateView(entities: [CVViewModelProtocol])
}

/**
 * Presenter -> Interactor
 **/
protocol CVPresenterToInteractorProtocol {
  var presenter: CVInteractorToPresenterProtocol? { get set }
  var dataHelper: CVInteractorToAPIDataManagerProtocol? { get set }
  func getCVData()

}

/**
 * Interactor -> Presenter
 **/
protocol CVInteractorToPresenterProtocol {
  func didGetData(model: [CVViewModel])
}

/**
 * Interactor -> DataManager
 **/
protocol CVInteractorToAPIDataManagerProtocol {
  var interactor: CVAPIDataManagerToInteractorProtocol? { get set }
  var errorHelper: CVAPIDataManagerToErrorHelperProtocol? { get set }
  func getCVDataFromService()
}

/**
 * DataManager -> Interactor
 **/
protocol CVAPIDataManagerToInteractorProtocol {
  func didGetCVDataFromService(cvData: CVData)
}

/**
 * Presenter -> Wireframe
 **/
protocol CVPresenterToRouterProtocol {
  func popViewController(from viewController: UIViewController)
}

/**
 * Configure the elements of the cell.
 **/
protocol CVCellConfigure {
  func configure(element: CVViewModelProtocol)
}

/**
 * DataManager -> ErrorHelper
 **/
protocol CVAPIDataManagerToErrorHelperProtocol {
  var view: CVErrorHelperToViewControllerProtocol? { get set}
  func didGetError(error: CVErrorHelper.ErrorTypes)
}

/**
 *  ErrorHelper -> ViewController
 **/
protocol CVErrorHelperToViewControllerProtocol {
  func showErrorModal(errorAlert: UIAlertController)
}
