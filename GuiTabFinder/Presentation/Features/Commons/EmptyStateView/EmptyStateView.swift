//
//  EmptyStateView.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 14/7/23.
//

import UIKit

// MARK: EmptyStateView

final class EmptyStateView: UIView {
    
    private (set) var message: UILabel = {
        let message = UILabel(frame: .zero)
        message.translatesAutoresizingMaskIntoConstraints = false
        return message
    }()
    
    func configure() {
        setupMessageLabel()
    }
    
    func setupMessageLabel() {
        addSubview(message)
        message.numberOfLines = Constants.messageNumberOfLines
        message.textAlignment = .center
        message.text = Localizables.searchBarEmptyStateMessage.localized
        message.font = Fonts.messageFont
        setupMessageLabelConstraints()
    }
}
