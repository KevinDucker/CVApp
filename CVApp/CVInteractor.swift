//
//  CVInteractor.swift
//  CVApp
//
//  Created by Kevin Ducker Marin on 5/24/19.
//  Copyright © 2019 Kevin Ducker Marin. All rights reserved.
//

import Foundation

class CVInteractor {

  // MARK: Properties
  var presenter: CVInteractorToPresenterProtocol?
  var dataHelper: CVInteractorToAPIDataManagerProtocol?

}

extension CVInteractor: CVPresenterToInteractorProtocol {
  func getCVData() {
    dataHelper?.getCVDataFromService()
  }
}

extension CVInteractor: CVAPIDataManagerToInteractorProtocol {
  func didGetCVDataFromService() {
    presenter?.didGetData()
  }
}
