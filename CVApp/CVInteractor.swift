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

  typealias constants = CVConstants

  private func parseDataInViewModel(cvData: CVData) {
    let model = [
      CVViewModel(title: constants.name, desc: cvData.name),
      CVViewModel(title: constants.sumary, desc: cvData.summary),
      CVViewModel(title: constants.summaryQualifications, desc: cvData.summaryQualifications),
      CVViewModel(title: constants.languages, desc: cvData.languages),
      CVViewModel(title: constants.carrer, desc: (cvData.carrer.first?.description)!)]
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
