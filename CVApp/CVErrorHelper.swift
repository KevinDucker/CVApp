//
//  CVErrorHelper.swift
//  CVApp
//
//  Created by Kevin Ducker Marin on 5/25/19.
//  Copyright © 2019 Kevin Ducker Marin. All rights reserved.
//

import Foundation
import UIKit

struct CVErrorHelper {

  // MARK: Properties
  var view: CVErrorHelperToViewControllerProtocol?

  typealias constants = CVConstants

  enum ErrorTypes: String {
    case dataError
    case connectionError
    case decodingError
  }

  // MARK: - Private functions

  /**
   * Receives the error type to generate the corresponding alert
   - parameters:
   - error: Vlidated to generate the alert
   **/
  private func showErrorModal(error: ErrorTypes) {
    switch error {
    case .dataError:
      createErrorAlert(errorTitle: constants.dataError, errorMessage: "", okButton: constants.alertOk)
    case .connectionError:
      createErrorAlert(errorTitle: constants.connectionError, errorMessage: "", okButton: constants.alertOk)
    case .decodingError:
      createErrorAlert(errorTitle: constants.decodingError, errorMessage: "", okButton: constants.alertOk)
    }
  }

  /**
   * Generates the alertController with the received data
   - parameters:
   - errorTitle: The error title
   - errorMessage: Message for the alert
   - okButton: Action button title
   **/
  private func createErrorAlert(errorTitle: String, errorMessage: String, okButton: String) {

    let alertController = UIAlertController(title: errorTitle,
                                            message: errorMessage,
                                            preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: okButton,
                                            style: .cancel,
                                            handler: nil))
    view?.showErrorModal(errorAlert: alertController)
  }
}

// MARK: - CVAPIDataManagerToErrorHelperProtocol implementation
extension CVErrorHelper: CVAPIDataManagerToErrorHelperProtocol {
  /**
   * Receives the error type to generate the corresponding alert
   - parameters:
   - error: Sended to the private function for validation
   **/
  func didGetError(error: CVErrorHelper.ErrorTypes) {
    showErrorModal(error: error)
  }
}

