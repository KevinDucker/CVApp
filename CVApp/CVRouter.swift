//
//  CVRouter.swift
//  CVApp

import UIKit

class CVRouter {

  // MARK: - Attributes
  public weak var window: UIWindow?

  // MARK: - Initializers
  init(window: UIWindow) {
    self.window = window
    self.loadCV()
  }

  // MARK: Private functions
  private func loadCV() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let VC: ViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
    var presenter: CVViewToPresenterProtocol & CVInteractorToPresenterProtocol = CVPresenter()
    var interactor: CVPresenterToInteractorProtocol & CVAPIDataManagerToInteractorProtocol = CVInteractor()
    var dataHelper: CVInteractorToAPIDataManagerProtocol = CVConnectionHelper(url: ResumeURL.success.rawValue)
    presenter.view = VC
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.dataHelper = dataHelper
    dataHelper.interactor = interactor
    VC.presenter = presenter
    self.window?.rootViewController = UINavigationController(rootViewController: VC)
  }
}

// MARK: CVPresenterToRouterProtocol implementation
extension CVRouter: CVPresenterToRouterProtocol {
  func popViewController(from viewController: UIViewController) {
  }
}
