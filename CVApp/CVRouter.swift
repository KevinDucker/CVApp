//
//  CVRouter.swift
//  CVApp
//
//  Created by Kevin Ducker Marin on 5/24/19.
//  Copyright © 2019 Kevin Ducker Marin. All rights reserved.
//

import UIKit

class CVRouter {

  // MARK: - Attributes
  public weak var window: UIWindow?

  // MARK: - Initializers
  init(window: UIWindow) {
    self.window = window
    self.loadCV()
  }

  private func loadCV() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let VC: ViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
    var presenter: CVViewToPresenterProtocol & CVInteractorToPresenterProtocol = CVPresenter()
    var interactor: CVPresenterToInteractorProtocol & CVAPIDataManagerToInteractorProtocol = CVInteractor()
    var dataHelper: CVInteractorToAPIDataManagerProtocol = CVConnectionHelper()
    presenter.view = VC
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.dataHelper = dataHelper
    dataHelper.interactor = interactor
    VC.presenter = presenter
    self.window?.rootViewController = UINavigationController(rootViewController: VC)
  }
}

extension CVRouter: CVPresenterToRouterProtocol {
  func popViewController(from viewController: UIViewController) {
  }
}
