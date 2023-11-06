//
//  RespError.swift
//  DekD-ios-challenge
//
//  Created by Simon Siwell on 6/11/2566 BE.
//

import Foundation

enum RespError: String, Error {
    case declaration = "declare properties failed."
    case decodeObj = "decode object failed."
    case authorize = "Unable to authenticate user."
    case unavailableServer = "Server is unavailable."
}
