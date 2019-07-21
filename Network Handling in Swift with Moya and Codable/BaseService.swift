//
//  BaseService.swift
//  VoltLines
//
//  Created by Alaa Al-Zaibak on 22.07.2019.
//  Copyright © 2019 VoltLines. All rights reserved.
//

import Moya

protocol BaseService: TargetType {
}

extension BaseService {
    var headers: [String : String]? {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return [ "App-Version" :  version ]
        }
        else {
            return nil
        }
    }
}
