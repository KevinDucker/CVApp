//
//  CVCellTitle.swift
//  CVApp

import Foundation
import UIKit

class CVCellTitle: UITableViewCell {

  // Identifier of the cell
  static let nib = "CVCellTitle"
  let titleSize: CGFloat = 16

  @IBOutlet weak var cvContent: UIView!
  @IBOutlet weak var cvDesc: UILabel!
  @IBOutlet weak var cvName: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    setup()
  }

  /*
   Setup the elements of the cell.
   */
  func setup() {
    self.backgroundColor = .groupTableViewBackground
    cvContent.layer.cornerRadius = 4
    cvContent.layer.masksToBounds = false
    cvContent.layer.shadowOffset = CGSize(width: 0, height: 0)
    cvContent.layer.shadowColor = UIColor.gray.cgColor
    cvContent.layer.shadowOpacity = 0.23
    cvContent.layer.shadowRadius = 8

    cvName.textAlignment = .left
    cvName.textColor = UIColor.darkGray
    cvDesc.textAlignment = .justified
    cvDesc.textColor = UIColor.darkGray
  }
}

extension CVCellTitle: CVCellConfigure {
  func configure(element: CVViewModelProtocol) {
    cvName.text = element.title
    cvDesc.text = element.desc
  }
}
