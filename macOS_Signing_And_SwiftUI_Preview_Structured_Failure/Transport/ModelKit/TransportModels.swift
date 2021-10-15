//
//  TransportModels.swift
//  ModelKit
//
//  Created by Ed Ford on 7/8/21.
//

import Foundation
import TrainKit

public class ModelCollection {
    let train = Train()
    
    public init() {
        
    }
}

extension ModelCollection: CustomStringConvertible {
    public var description: String {
        return """
            \(train)
        """
    }
}
