//
//  DateViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 4/10/23.
//

import UIKit

class DateViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView! {
        didSet {
            mainView.backgroundColor = .secondarySystemGroupedBackground
        }
    }
    
    @IBOutlet weak var datePicker: UIDatePicker! {
        didSet {
            datePicker.datePickerMode = .date
            if #available(iOS 14.0, *) {
                datePicker.preferredDatePickerStyle = .inline
            }
            datePicker.maximumDate = Date()
            //datePicker.backgroundColor = UIColor(hexString: "#ECEEF5").withAlphaComponent(0.4)
        }
    }

    @IBOutlet weak var okButton: UIButton! {
        didSet {
            self.okButton.applyStyle(buttonStyleEnum: .rounded(backgroundcolor: .App.mainText,
                                                             textColor: .label,
                                                             text: "OK",
                                                             font: .systemFont(ofSize: 28, weight: .black)))
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .clear
        self.mainView.roundCorners(corners: [.topLeft, .topRight], radius: 12)
    }

}
