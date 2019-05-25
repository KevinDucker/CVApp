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
    let urlRaw = "https://gist.githubusercontent.com/KevinDucker/7e0656d0bfeb59d125ace3f07082db1d/raw/3e60b3d8a1178bd6f50d70a097c9379396476887/CVJson.json"
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
          DispatchQueue.main.async {
            self.interactor?.didGetCVDataFromService(cvData: cv)
          }
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
