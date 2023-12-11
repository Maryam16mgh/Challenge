//
//  modle.swift
//  swiftUI
//
//  Created by Lujain Yhia on 14/05/1445 AH.
//
//

import Foundation
struct Even1: Identifiable{

let id = UUID()
let EventName: String
let Picter : String
let City: String

init(EventName: String, Picter: String, City: String) {
    self.EventName = EventName
    self.Picter = Picter
    self.City = City
}
}
var event:Array<Even1> =
[Even1(EventName: "DataHacK هاكاثون ", Picter: "DataHack", City: "📍 الرياض")]
