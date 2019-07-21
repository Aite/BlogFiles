//
//  RatingNetwork.swift
//  VoltLines
//
//  Created by Alaa Al-Zaibak on 22.07.2019.
//  Copyright © 2019 VoltLines. All rights reserved.
//

class RatingNetwork: BaseNetwork {

    private static var instance = RatingNetwork()
    public static var shared : RatingNetwork {
        return instance
    }
    private override init() { }
    
    func fetchRating(completion: ((VLDRatingResponse) -> ())?, failure: NetworkFailureBlock?) {
        RatingProvider.request(RatingService.fetchRating) { (result) in
            self.processResponse(result: result, completion: completion, failure: failure)
        }
    }
    
    func rate(driverRating: Float?, busRating: Float?, completion: (() -> ())?, failure: NetworkFailureBlock?) {
        RatingProvider.request(RatingService.rate(driver: driverRating, bus: busRating)) { (result) in
            self.processResponse(result: result, completion: completion, failure: failure)
        }
    }
}
