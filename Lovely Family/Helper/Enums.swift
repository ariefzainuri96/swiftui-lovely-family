//
//  Enums.swift
//  Simart UMBY
//
//  Created by фкшуа on 30/11/24.
//

import Foundation

enum RequestState {
    case SUCCESS, IDLE, ERROR, LOADING, LOADING_NEXT_PAGE, ERROR_NEXT_PAGE, MAX_PAGE
}

enum NetworkingError: Error {
    case INVALID_URL, INVALID_RESPONSE, INVALID_DATA
}
