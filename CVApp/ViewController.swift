//
//  ViewController.swift
//  CVApp

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!

  // MARK: Properties
  var presenter: CVViewToPresenterProtocol?
  var elements: [CVViewModelProtocol]?

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }

  /**
   * Go to back View
   **/
  @objc func backView() {
    presenter?.popViewController()
  }

  /**
   * Setup the elements which are used by the view
   **/
  private func setup() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = UITableView.automaticDimension
    tableView.tableFooterView = UIView()
    registerTableCells()
    presenter?.initialLoad(from: self)
  }

  /**
   * Register Table Cells so the TableView can find the Xib associated files
   **/
  func registerTableCells() {
    tableView.register(UINib(nibName: CVCellTitle.nib, bundle: nil), forCellReuseIdentifier: CVCellTitle.nib)
  }

  /**
   * Obtain the Table Cells nib name to find the Xib associated files
   **/
  func getCellType(index: Int) -> String {
    guard let elements = elements else { return "" }
    switch elements[index] {
    case is CVViewModel:
      return CVCellTitle.nib
    default:
      return ""
    }
  }

}

// MARK: InvestmentsPresenterToViewProtocol implementation
extension ViewController: CVPresenterToViewProtocol {

  /*
   Receives the investments params to update the data source and update the tableView
   - parameters:
   - invEntities: Object used to reload the tableView
   */

  func updateView(entities: [CVViewModelProtocol]) {
    elements = entities
    tableView.reloadData()
  }
}

// MARK: - UITableViewDelegate, UITableViewDataSource delegates
extension ViewController: UITableViewDelegate, UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let elements = elements else { return 0 }
    return elements.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let elements = elements else { return UITableViewCell() }
    let cellType = getCellType(index: indexPath.row)
    let element = elements[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: cellType, for: indexPath)
    presenter?.configureCell(cell: cell, element: element)
    return cell
  }
}

