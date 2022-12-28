//
//  RideType.swift
//  UberApp
//
//  Created by Aleksandr Shapovalov on 22/12/22.
//

import Foundation

enum RideType: Int, CaseIterable, Identifiable {
    case uberX
    case uberB
    case uberXL
    
    var id: Int { return rawValue}
    
    var description: String {
        switch self {
        case .uberX:
            return "UberX"
        case .uberB:
            return "Uber Black"
        case .uberXL:
            return "UberXL"
        }
    }
    
    var imageName: String {
        switch self {
        case .uberX:
            return "uber-x"
        case .uberB:
            return "uber-black"
        case .uberXL:
            return "uber-x"
        }
    }
    
    var baseFare: Double {
        switch self {
        case .uberX:
            return 5
        case .uberB:
            return 20
        case .uberXL:
            return 10
        }
    }
    
    func computePrice(for distanceInMeters: Double) -> Double {
        let distanceInMiles = distanceInMeters / 1600
        
            switch self {
            case .uberX:
                return distanceInMiles * 1.5 + baseFare
            case .uberB:
                return distanceInMiles * 2.5 + baseFare
            case .uberXL:
                return distanceInMiles * 1.75 + baseFare
            
        }
    }
}

