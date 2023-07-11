//
//  ObservableObject.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 5/4/23.
//

import Foundation

final class ObservableObject<T> {
    typealias Listener = (T) -> Void
    private var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind (listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
