//
//  ContentView.swift
//  Event
//
//  Created by shaden  on 09/05/1445 AH.
//


import SwiftUI
import CloudKit


struct EventSections: View {
    @State private var searchText = ""
    @State private var textInput: String = ""
    @State var event1 : [Even] = []
    
    
  @StateObject var viewModel = ViewModel()
    
    var searchResulte:[Even]{
        
        if searchText.isEmpty{
            return viewModel.event1
        } else {
            return viewModel.event1.filter { Fund in
                Fund.EventName.contains(searchText)

                
            }
        }
    }
    
    var body: some View {
        
        
            ZStack{
                
                
                
//                HStack(alignment: .center){
                    Image(systemName: "bell")
//                        .padding(.trailing,10)
//                        .padding(.bottom,700)
                        .font(.system(size: 30))
                        .foregroundColor(Color("midBlue"))
                        .offset(CGSize(width: 140, height: -350))
                    
                   
                    
//                }
                
                HStack {
                    
                    TextField("بحث", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .padding(.bottom,600)
                    
                    Button(action: {
                        searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color("midBlue"))
                    }
                    .offset(x:-15)
                    //.padding(.trailing)
                    .padding(.bottom,600)
                }
                
                Image(systemName: "slider.horizontal.3")
//                        .padding(.bottom,700)
//                        .padding(.trailing,10)
                          .font(.system(size: 25))
                          .foregroundColor(Color("midBlue"))
                          .offset(CGSize(width: 110, height: -300))
                
                
                //                         SearchBarView(searchText: $searchText)
                
                ScrollView{
                    //                                     SearchedView(searchText: searchText)
                    
                    ForEach(event1)  { fund in
                        NavigationLink(destination: EventsDetails()){
                            //  Text(fund.City)
                            
                            //   ForEach(searchResulte, id: \.EventName )  { fund in
                            ZStack{
                                
                                let assetsData = NSData(contentsOf: (fund.Picter.fileURL!))
                                
                                
                                let image : UIImage = UIImage(data: assetsData! as Data)!
                                
                                
                                
                                
                                
                                Image(uiImage:  image)
                                    .resizable()
                                    .frame(width: 350, height: 200)
                                    .cornerRadius(23)
                                    .opacity(0.7)
                                
                                //                            //    Image(fund.Picter)
                                //                                .resizable()
                                //                                .frame(width: 350, height: 200)
                                //                                .cornerRadius(23)
                                //                                .opacity(0.7)
                                
                                
                                RoundedRectangle(cornerRadius: 23)
                                    .fill(Color.white)
                                    .frame(width: 350, height: 40)
                                    .padding([.top],160)
                                    .opacity(0.6)
                                
                                
                                Text(fund.EventName)
                                    .padding(.leading, 180)
                                    .padding(.top,160)
                                
                                
                                
                                Text(fund.City)
                                    .padding(.top,160)
                                    .padding(.trailing, 220)
                                
                                
                                
                                //                            let assetsData = NSData(contentsOf: (fund.Picter.fileURL!))
                                //
                                //
                                //                            let image : UIImage = UIImage(data: assetsData! as Data)!
                                //
                                //
                                //
                                //
                                //
                                //                            Image(uiImage:  image)
                                //                                .resizable()
                                //                                .frame(width: 350, height: 200)
                                //                                .cornerRadius(23)
                                //                                .opacity(0.7)
                                //
                                //                            //                            //    Image(fund.Picter)
                                //                            //                                .resizable()
                                //                            //                                .frame(width: 350, height: 200)
                                //                            //                                .cornerRadius(23)
                                //                            //                                .opacity(0.7)
                                //
                                //
                                //                            RoundedRectangle(cornerRadius: 23)
                                //                                .fill(Color.white)
                                //                                .frame(width: 350, height: 40)
                                //                                .padding([.top],160)
                                //                                .opacity(0.6)
                                //
                                //
                                //                            Text(fund.EventName)
                                //
                                //                                .padding(.leading, 180)
                                //                                .padding(.top,160)
                                //
                                //
                                //
                                //                            Text(fund.City)
                                //                                .padding(.top,160)
                                //                                .padding(.trailing, 220)
                                
                                
                                
                            } }
                        .padding()
                    }
                    
                }.padding(.top,120)
                
            }
            .background(Image("background1").resizable().scaledToFill().ignoresSafeArea())
            
            .onAppear{
                
                print("Test!!!!!")
                fetchTest2()
            }
        
        }
        
        
    //}
    func fetchTest2(){
        
        print("fetchTest")
            let predicate = NSPredicate(value: true)
            //2
            //let predicate2 = NSPredicate(format: "firstName == %@", "Sara")
            
            //Record Type depends on what you have named it
            let query = CKQuery(recordType:"EventDetails", predicate: predicate)
            
            
            let operation = CKQueryOperation(query: query)
            operation.recordMatchedBlock = { recordId, result in
                DispatchQueue.main.async {
                    switch result{
                    case .success(let record):
                        print("fetchTest Shadan1")
                        
                        print(record)

                        let event = Even(record: record)
                        self.event1.append(event)
                        
                        print("the array count is \(event1.count)")
                       // let TestStrcut = TestStrcut(record: record)
                       // self.TestCode.append(TestStrcut)
                    case .failure(let error):
                        print("fetchTest Shadan 2")

                        print("\(error.localizedDescription)")
                    }
                }
            }
        
        
            
            CKContainer(identifier: "iCloud.M.ChallengeM2.Tahada").publicCloudDatabase.add(operation)
            
        print("fetchTest 3")

            
        }
//   func fetchEvent(){
//       print("event 1")
//       
//       
//    //   var assetURL = ""var assetURL = ""
//
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
//                    
//                    print("event 33333")
//
//                    switch result{
//
//                    case .success(let record):
//                        
//                        print("success")
//                        
//                        let event = Even(record: record)
//                        
//                        
//                         let assets = event.Picter
//                        let assetsData = NSData(contentsOf: (assets.fileURL!))
//                        
//                        
//                        print("the DAta is \(assetsData)")
//                        
////                        var asset: CKAsset = record["eventImage"] as? CKAsset ?? CKAsset(fileURL:URL(string:"https://arriyadiyah.com//media/thumb/a0/46/950_ddbcc44214.jpg")!) {
////                            assetURL = asset.fileURL?.path ?? "AW/mPuB6BFEfrGgQxZlOvrmLPE8/"
////                            DispatchQueue.main.async {
////                             completion(UIImage(contentsOfFile: assetURL) ?? AppImages.gameDefaultImage)
////                                                        }
////                        }
//                        
//                        self.event1.append(event)
//                        
//                    case .failure(let error):
//                        print("failure")
//
//                        print("\(error.localizedDescription)")
//                    }
//                }
//            }
//            
//            CKContainer(identifier: "iCloud.M.ChallengeM2.Tahada").publicCloudDatabase.add(operation)
//            
//            
//       print("event 2")
//
//        }
}
    



#Preview {
    EventSections()
    }

//struct SearchBarView: View {
//
//    @Binding var searchText: String
//
//    var body: some View {
//        HStack {
//
//            TextField("بحث", text: $searchText)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding(.horizontal)
//                .padding(.bottom,600)
//
//            Button(action: {
//                searchText = ""
//            }) {
//               Image(systemName: "xmark.circle.fill")
//                    .foregroundColor(Color("bluee"))
//            }
//            .padding(.trailing)
//            .padding(.bottom,600)
//        }
//    }
//}

//    private struct SearchedView: View {
//
//        var searchText:String
//
//        var body: some View {
//
//            ForEach(searchResulte, id: \.EventName )  { fund in
//                    ZStack{
//
//                 Image(fund.Picter)
//                 .resizable()
//                 .frame(width: 350, height: 200)
//                 .cornerRadius(23)
//                 .opacity(0.7)
//
//
//                 RoundedRectangle(cornerRadius: 23)
//                 .fill(Color.white)
//                 .frame(width: 350, height: 40)
//                 .padding([.top],160)
//                 .opacity(0.6)
//
//
//                 Text(fund.EventName)
//
//                  .padding(.leading, 180)
//                  .padding(.top,160)
//
//
//
//                 Text(fund.City)
//                  .padding(.top,160)
//                  .padding(.trailing, 220)
//
//
//
//                 }
//                 .padding()
//            }
//        }
//
//
//    }



/*
 
 
 ForEach(searchResulte, id: \.EventName )  { fund in
         ZStack{
      
      Image(fund.Picter)
      .resizable()
      .frame(width: 350, height: 200)
      .cornerRadius(23)
      .opacity(0.7)
      
      
      RoundedRectangle(cornerRadius: 23)
      .fill(Color.white)
      .frame(width: 350, height: 40)
      .padding([.top],160)
      .opacity(0.6)
      
      
      Text(fund.EventName)
       
       .padding(.leading, 180)
       .padding(.top,160)
     
      
      
      Text(fund.City)
       .padding(.top,160)
       .padding(.trailing, 220)

      
      
      }
      .padding()
 }
 
 
        @State var event1 = Even(EventName: "", Picter: "", City: "")
 
 
 
        var searchResulte:[Even]{
            if searchText.isEmpty{
                return viewModel.event1
            } else {
                return event.filter { Fund in
                    Fund.EventName.contains(searchText)


                }
            }
        }
 
 
 
 
 
 
 */
