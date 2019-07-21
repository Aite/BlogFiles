//
//  RatingAPI.swift
//  VoltLines
//
//  Created by Alaa Al-Zaibak on 22.07.2019.
//  Copyright © 2019 VoltLines. All rights reserved.
//

import Moya

enum RatingService {
    case rate(driver: Float?, bus: Float?)
    case fetchRating
}

let RatingProvider = MoyaProvider<RatingService>(
    plugins: [
        NetworkLoggerPlugin(
            verbose: true,
            responseDataFormatter: JSONResponseDataFormatter
        )
    ]
)

extension RatingService: AuthorizedTargetType {
    var needsAuth: Bool {
        return true
    }

    var baseURL: URL {
        return URL(string:ServiceConstants.baseURL)!
    }

    var path: String {
        switch self {
        case .fetchRating,.rate:
            return "rating/"
        }
    }

    var method: Moya.Method {
        switch self {
        case .fetchRating:
            return .get
        case .rate:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .fetchRating:
            return .requestPlain
        case .rate(let driver, let bus):
            var parameters = [String : Float]()
            if let rating = driver {
                parameters["driver_rating"] = rating
            }
            if let rating = bus {
                parameters["bus_rating"] = rating
            }
            return Task.requestParameters(
                parameters: parameters,
                encoding: JSONEncoding.default
            )
        }
    }

    var sampleData: Data {
        return Data()
    }
}
