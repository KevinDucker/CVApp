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
    let url = "https://gist.githubusercontent.com/KevinDucker/7e0656d0bfeb59d125ace3f07082db1d/raw/3e60b3d8a1178bd6f50d70a097c9379396476887/CVJson.json"
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let VC: ViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
    var presenter: CVViewToPresenterProtocol & CVInteractorToPresenterProtocol = CVPresenter()
    var interactor: CVPresenterToInteractorProtocol & CVAPIDataManagerToInteractorProtocol = CVInteractor()
    var dataHelper: CVInteractorToAPIDataManagerProtocol = CVConnectionHelper(url: url)
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
