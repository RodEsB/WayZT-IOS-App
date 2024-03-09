//
//  Profile.swift
//  Waste Manager
//
//  Created by Ultiimate Dog on 28/02/24.
//

import Foundation
import SwiftUI

// Creates the struct for the profile
struct Profile {
    var username: String
    var weekStreak: Int
    var anims = [false, false, false, false]
    
    var currentWaste: Int
    var wasteGoal: Int
    var hisWaste: Int
    var once = true
    
    var RecWaste: Int
    var RecWasteGoal: Int
    var hisRecW: Int
    
    var OrgWaste: Int
    var OrgWasteGoal: Int
    var hisOrgW: Int
    
    var GlassWaste: Int
    var GlassWasteGoal: Int
    var hisGlassW: Int
    
    var E_Waste: Int
    var E_WasteGoal: Int
    var hisE_Waste: Int
    
    static let `default` = Profile(username: "UltiimateDog")
    
    init(username: String) {
        self.username = username
        weekStreak = 32
        
        RecWaste = 10
        RecWasteGoal = 10
        OrgWaste = 3
        OrgWasteGoal = 6
        GlassWaste = 4
        GlassWasteGoal = 8
        E_Waste = 1
        E_WasteGoal = 2
        
        hisOrgW = 70
        hisRecW = 120
        hisGlassW = 37
        hisE_Waste = 9
        
        currentWaste = RecWaste + OrgWaste + GlassWaste + E_Waste
        wasteGoal = RecWasteGoal + OrgWasteGoal + GlassWasteGoal + E_WasteGoal
        hisWaste = hisOrgW + hisRecW + hisGlassW + hisE_Waste
        checkGoals()
    }
    
    mutating func changeGoals(RGoal: Int?, OGoal: Int?, GGoal: Int?, EGoal: Int?) {
        RecWasteGoal = RGoal ?? RecWasteGoal
        OrgWasteGoal = OGoal ?? OrgWasteGoal
        GlassWasteGoal = GGoal ?? GlassWaste
        E_WasteGoal = EGoal ?? E_WasteGoal
        wasteGoal = RecWasteGoal + OrgWasteGoal + GlassWasteGoal + E_WasteGoal
    }
    
    mutating func AddWaste(quantity: Int, type: String) {
        if quantity <= 0 {
            return
        }
        switch type {
        case "Recycle":
            RecWaste += quantity
            hisRecW += quantity
        case "Organic":
            OrgWaste += quantity
            hisOrgW += quantity
        case "Electronic":
            E_Waste += quantity
            hisE_Waste += quantity
        case "Glass":
            GlassWaste += quantity
            hisGlassW += quantity
        default:
            return
        }
        hisWaste += quantity
        currentWaste = RecWaste + OrgWaste + GlassWaste + E_Waste
        if once && currentWaste >= wasteGoal {
            weekStreak += 1
            once = false
        }
        checkGoals()
    }
    
    mutating func checkGoals() {
        if RecWaste >= RecWasteGoal {
            anims[0] = true
        }
        if OrgWaste >= OrgWasteGoal {
            anims[1] = true
        }
        if GlassWaste >= GlassWasteGoal {
            anims[2] = true
        }
        if E_Waste >= E_WasteGoal {
            anims[3] = true
        }
    }
}
