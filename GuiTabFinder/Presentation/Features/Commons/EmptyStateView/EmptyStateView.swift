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
        
//    private (set) var animationView: LottieAnimationView = {
//        let animationView = LottieAnimationView.init()
//        animationView.translatesAutoresizingMaskIntoConstraints = false
//        return animationView
//    }()
    
    func configure() {
        //setupAnimationView()
        setupMessageLabel()
    }
    
//    func setupAnimationView() {
//        addSubview(animationView)
//        animationView.animation = LottieAnimation.named(LottieFiles.loading)
//        animationView.loopMode = .loop
//        animationView.play()
//        setupAnimationViewConstraints()
//    }
    
    func setupMessageLabel() {
        addSubview(message)
        message.numberOfLines = Constants.messageNumberOfLines
        message.textAlignment = .center
        message.text = Localizables.searchBarEmptyStateMessage.localized
        message.font = Fonts.messageFont
        setupMessageLabelConstraints()
    }
}
