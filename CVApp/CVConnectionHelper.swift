//
//  CVConnectionHelper.swift
//  CVApp

import Foundation

class CVConnectionHelper {

  // MARK: Properties
  var interactor: CVAPIDataManagerToInteractorProtocol?
  var errorHelper: CVAPIDataManagerToErrorHelperProtocol?

  // MARK: Private variables
  private var session: URLSession
  private var plist: [AnyHashable: Any]?

  // MARK: Public variables
  public var url: String

  // MARK: - Initializers
  public init(url: String) {
    self.url = url
    self.session = URLSession(configuration: .default)
    if let path = Bundle.main.path(forResource: CVConstants.infoPlistName, ofType: CVConstants.infoPlistType) {
      self.plist = NSDictionary(contentsOfFile: path) as? [AnyHashable: Any]
    }
  }

  // MARK: Public functions
  func loadCVData() {
    guard let urlString = self.plist?[url] as? String, let url = URL(string: urlString) else { return }
    let task = session.dataTask(with: url) { data, response, error in
      if let error = error {
        debugPrint(CVConstants.dataError, error)
        DispatchQueue.main.async {
          self.errorHelper?.didGetError(error: .dataError)
        }

      } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200  {
        do {
          let decoder = JSONDecoder()
          decoder.keyDecodingStrategy = .convertFromSnakeCase
          let cv = try decoder.decode(CVData.self, from: data)
          DispatchQueue.main.async {
            self.interactor?.didGetCVDataFromService(cvData: cv)
          }
        } catch let jsonError {
          debugPrint(CVConstants.decodingError, jsonError)
          DispatchQueue.main.async {
            self.errorHelper?.didGetError(error: .decodingError)
          }
        }
      } else {
        debugPrint(CVConstants.connectionError)
        DispatchQueue.main.async {
          self.errorHelper?.didGetError(error: .connectionError)
        }
      }
    }
    task.resume()
  }

}

// MARK: CVInteractorToAPIDataManagerProtocol implementation
extension CVConnectionHelper: CVInteractorToAPIDataManagerProtocol {
  func getCVDataFromService() {
    loadCVData()
  }
}
