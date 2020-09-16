//
//  DataTransferError.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 15/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation

extension DataTransferError: ConnectionError {
    public var isInternetConnectionError: Bool {
        guard case let DataTransferError.networkFailure(networkError) = self,
            case .notConnected = networkError else {
                return false
        }
        return true
    }
}
