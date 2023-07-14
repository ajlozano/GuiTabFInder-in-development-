//
//  AppError.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 14/7/23.
//

import Foundation

enum AppError: Error {
    case serviceError(message: String)
    case decodeError(forDecodable: String)
    case parseError(message: String)
    case unknownError(message: String)
    case manageFetchDataError(message: String)
}
