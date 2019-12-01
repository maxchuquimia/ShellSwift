//
//  File.swift
//  
//
//  Created by Max Chuquimia on 1/12/19.
//

import Foundation
import SynchronousRequests

public func curl(_ a: URL) throws -> Data { try curl()(a) }

public func curl() -> (URL) throws -> Data {{
    try URLSession.shared.throwingSynchronousDataTask(with: $0).data
}}
