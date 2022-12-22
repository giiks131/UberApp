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
}

