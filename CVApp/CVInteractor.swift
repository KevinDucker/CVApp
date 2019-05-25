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

  private func parseDataInViewModel(cvData: CVData) {
    let model = CVViewModel(image: cvData.summary, title: cvData.name)
    presenter?.didGetData(model: model)
  }
}

extension CVInteractor: CVPresenterToInteractorProtocol {
  func getCVData() {
    dataHelper?.getCVDataFromService()
  }
}

extension CVInteractor: CVAPIDataManagerToInteractorProtocol {
  func didGetCVDataFromService(cvData: CVData) {
    parseDataInViewModel(cvData: cvData)
  }
}
