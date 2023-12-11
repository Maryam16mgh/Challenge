//
//  ViewModel .swift
//  Event
//
//  Created by shaden  on 16/05/1445 AH.
//

import Foundation
import CloudKit

    
    
    
    
class ViewModel: ObservableObject{
    
    @Published var event1: [Even] = []
    
   func fetchEvent(){
           let predicate = NSPredicate(value: true)
           //2            //let predicate2 = NSPredicate(format: "firstName == %@", "Sara")
//
//            //Record Type depends on what you have named it
           let query = CKQuery(recordType:"EventDetails", predicate: predicate)
//
//
           let operation = CKQueryOperation(query: query)
           operation.recordMatchedBlock = { recordId, result in
               DispatchQueue.main.async {
                    switch result{
                    case .success(let record):
                        
                        let event = Even(record: record)
                        self.event1.append(event)
                        
                    case .failure(let error):
                        print("\(error.localizedDescription)")
                    }
                }
            }
            CKContainer(identifier: "iCloud.M.ChallengeM2.Tahada").publicCloudDatabase.add(operation)
//
//
//
        }

    
    
}
    

    



 
