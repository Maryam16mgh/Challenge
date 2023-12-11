//
//  EventDetaies.swift
//  Event
//
//  Created by shaden  on 09/05/1445 AH.
//

import Foundation
import CloudKit


//available = "\Ud83d\Udd34 \U063a\U064a\U0631 \U0645\U062a\U0627\U062d";
//eventCity = "\Ud83d\Udccd \U0627\U0644\U0631\U064a\U0627\U0636";
//eventDate = "2023-11-15 11:33:00 +0000";
//eventDetails = "\U0641\U0639\U0627\
struct Even: Identifiable{
    
    let id : CKRecord.ID
    let EventName: String
    let Picter : CKAsset
    let City: String
    let EventDate: Date
    let EventDetails : String
    let available : String
    
    
    init(record :CKRecord){
        self.id = record.recordID
        self.EventName = record["eventName"] as? String ?? "N/A"
        self.City = record["eventCity"] as? String ?? "N/A"
        self.Picter = record["eventImage"] as? CKAsset ?? CKAsset(fileURL:URL(string:"https://arriyadiyah.com//media/thumb/a0/46/950_ddbcc44214.jpg")!)
        self.EventDate = record["eventDate"] as? Date ?? Date()
        self.EventDetails = record["eventDetails"] as? String ?? "N/A"
        self.available = record["available"] as? String ?? "N/A"

        printfilePath ()
    }
    
    
    func printfilePath ()
    {
        print("the file is \(String(describing: self.Picter.fileURL))")
    }
}


    
/*    init(EventName: String, Picter: String, City: String) {
        self.EventName = EventName
        self.Picter = Picter
        self.City = City
    } */
//}


//var event:Array<Even> =
//[Even(EventName: "BlackHat بلاك هات ",Picter: "BlackHat",City:"📍الرياض"),
//Even(EventName: "DataHacthon هاكاثون ", Picter: "DataHack", City: "📍الرياض")]
