//
//  PopoverSetUpUseCase.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 4/8/23.
//

import Foundation
import UIKit

enum PopoverSetupUseCaseEnum {
    case label(String)
    case attributedLabel(NSAttributedString)
    case custom(UIView)
}

protocol PopoverSetupUseCaseProtocol {
    var popoverSetupUseCaseEnum: PopoverSetupUseCaseEnum { get set }
    init(popoverSetupUseCaseEnum: PopoverSetupUseCaseEnum)
    func execute(completion: (UIView) -> Void, size: CGSize)
}

class PopoverSetupUseCase: PopoverSetupUseCaseProtocol {
    var popoverSetupUseCaseEnum: PopoverSetupUseCaseEnum
    
    required init(popoverSetupUseCaseEnum: PopoverSetupUseCaseEnum) {
        self.popoverSetupUseCaseEnum = popoverSetupUseCaseEnum
    }
    
    func execute(completion: (UIView) -> Void, size: CGSize) {
        switch self.popoverSetupUseCaseEnum {
        case  .custom(let view):
            view.backgroundColor = .clear
            completion(view)
        case .label(let string):
            let label = EdgeInsetLabel()
            label.textInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            label.text = string
            label.numberOfLines = 0
            label.font = .systemFont(ofSize: 12, weight: .regular)
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.5
            label.sizeToFit()
            label.backgroundColor = .clear
            completion(label)
        case .attributedLabel(let attributedString):
            let label = EdgeInsetLabel()
            label.textInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            label.attributedText = attributedString
            label.numberOfLines = 0
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.5
            label.sizeToFit()
            label.backgroundColor = .clear
            completion(label)
        }
    }
}
