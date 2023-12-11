//
//  ContentView.swift
//  Challenge
//
//  Created by Maryam Mohammad on 09/05/1445 AH.
//




import SwiftUI
import CloudKit





struct HomePage: View {
    @State var isSheetShowing = false
    
    //@State var TestCode : [TestStrcut] = []
    
    var body: some View {
        NavigationView{
            
            VStack{
                
                
                //                ForEach(TestCode) { code in
                //                    /*@START_MENU_TOKEN@*/Text(code.TestName)/*@END_MENU_TOKEN@*/
                //                }
                HStack{
                    
                    Button(action:{
                        isSheetShowing.toggle()
                    }) {
                        Image(systemName:"plus.circle.fill")
                            .resizable()
                        //.offset(x: -150 , y: -250)
                            .frame(width: 35 ,height: 35)
                            .foregroundColor(Color("midBlue"))
                        
                        
                            .sheet(isPresented: $isSheetShowing){
                                EventSend()
                            }
                    }
                    
                    Image("logo")
                        .resizable()
                        .frame(width: 243 ,height: 123)
                }
                .offset( x:-20 )
                .padding(.top , 60)
                
                Text("الفعاليات الرائجة")
                    .font(.title)
                    .frame(width: 329 , height: 45 , alignment: .trailing)
                //.frame(alignment: .trailing)
                //.padding(.trailing, -150.0)
                    .foregroundStyle(Color("darkBlue"))
                    .offset(y:-15)
                
                
                SliderImages()
                
                
                
                Text("الأقسام")
                    .frame(width: 329 , height: 45 , alignment: .trailing)
                    .font(.title)
                    .foregroundStyle(Color("darkBlue"))
                    .offset(y:-95)
                //.padding(.trailing , -700)
                
                GridSection()
                
            }
            //            .onAppear{
            //                //  fetchTest2()
            //            }
            
            
            
            
            .background(
                Image("fullScreen")
                    .resizable()
                    .frame(width: 423 , height: 800))
            .ignoresSafeArea()
        }
    }
}
    
//    func fetchTest(){
//        
//        print("fetchTest")
//            let predicate = NSPredicate(value: true)
//            //2
//            //let predicate2 = NSPredicate(format: "firstName == %@", "Sara")
//            
//            //Record Type depends on what you have named it
//            let query = CKQuery(recordType:"TestCloud", predicate: predicate)
//            
//            
//            let operation = CKQueryOperation(query: query)
//            operation.recordMatchedBlock = { recordId, result in
//                DispatchQueue.main.async {
//                    switch result{
//                    case .success(let record):
//                        print("fetchTest 1")
//
//                        let TestStrcut = TestStrcut(record: record)
//                        self.TestCode.append(TestStrcut)
//                    case .failure(let error):
//                        print("fetchTest 2")
//
//                        print("\(error.localizedDescription)")
//                    }
//                }
//            }
//        
//        
//            
//            CKContainer(identifier: "iCloud.M.ChallengeM2.Tahada").publicCloudDatabase.add(operation)
//            
//        print("fetchTest 3")
//
//            
//        }
//    
//    
//    func fetchTest2(){
//        
//        print("fetchTest")
//            let predicate = NSPredicate(value: true)
//            //2
//            //let predicate2 = NSPredicate(format: "firstName == %@", "Sara")
//            
//            //Record Type depends on what you have named it
//            let query = CKQuery(recordType:"EventDetails", predicate: predicate)
//            
//            
//            let operation = CKQueryOperation(query: query)
//            operation.recordMatchedBlock = { recordId, result in
//                DispatchQueue.main.async {
//                    switch result{
//                    case .success(let record):
//                        print("fetchTest Shadan1")
//                        
//                        print(record)
//
//                       // let TestStrcut = TestStrcut(record: record)
//                       // self.TestCode.append(TestStrcut)
//                    case .failure(let error):
//                        print("fetchTest Shadan 2")
//
//                        print("\(error.localizedDescription)")
//                    }
//                }
//            }
//        
//        
//            
//            CKContainer(identifier: "iCloud.M.ChallengeM2.Tahada").publicCloudDatabase.add(operation)
//            
//        print("fetchTest 3")
//
//            
//        }
//    }
//}



#Preview {
    HomePage()
}

//struct TestStrcut : Identifiable {
//    let id : CKRecord.ID
//    let TestName : String
//    
//    
//    
//    init(record:CKRecord){
//        self.id        = record.recordID
//        self.TestName = record["Testing"] as? String ?? "N/A"
//   
//    }
//    
//}
