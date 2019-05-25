//
//  CVConnectionHelper.swift
//  CVApp
//
//  Created by Kevin Ducker Marin on 5/24/19.
//  Copyright © 2019 Kevin Ducker Marin. All rights reserved.
//

import Foundation

class CVConnectionHelper {

  // MARK: Properties
  var interactor: CVAPIDataManagerToInteractorProtocol?

  private var session: URLSession

  init() {
    self.session = URLSession(configuration: .default)
  }

  func loadCVData() {
    let urlRaw = "https://github.globant.com/raw/gist/kevin-ducker/b67069b1b98822f230712af3ad986741/raw/2212cd6a55c19b0d0e0192c7d681a04a852000e5/CVJson?token=AAACJHPABwcP1xyaBi7wW-a5ZL1C3tAAks5c8dMnwA%3D%3D"
    guard let url = URL(string: urlRaw) else { return }
    let task = session.dataTask(with: url) { data, response, error in
      if let error = error {
        DispatchQueue.main.async {
          debugPrint("Fail to get data", error)
          //Error alert Do it
          return
        }

      } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200  {
        do {
          let decoder = JSONDecoder()
          decoder.keyDecodingStrategy = .convertFromSnakeCase
          let cv = try decoder.decode(CVData.self, from: data)
          print(cv)
          self.interactor?.didGetCVDataFromService()
        } catch let jsonError {
          debugPrint("Failed to decode", jsonError)
          //Error alert Do it
        }
      } else {
        print("Connection error")
      }
    }
    task.resume()
  }

}

extension CVConnectionHelper: CVInteractorToAPIDataManagerProtocol {
  func getCVDataFromService() {
    loadCVData()
  }
}
