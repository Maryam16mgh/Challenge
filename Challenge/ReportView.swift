//
//  ReportView.swift
//  playingWithTahada
//
//  Created by Hasna Ahmed on 20/05/1445 AH.
//

import SwiftUI

struct ReportView: View {
    @State private var reportText = ""
    @Environment(\.presentationMode) var presentationMode
    @State private var isReportSent = false

    var body: some View {
        ZStack{
            Image("fullScreen")
                .resizable()
                .frame(width: 423 , height: 800)
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 243 ,height: 123)
                
                Text("ابلاغ عن مشكلة...")
                    .foregroundColor(Color("midBlue"))
                    .font(.title)
                    .padding()
                
                TextField("اشرح مشكلتك ...", text: $reportText)
                    .frame(height: 150)
                    .multilineTextAlignment(.trailing)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                
                
                Button(action: {
                    sendReport()
                }) {
                    Text("ارسال!")
                        .padding()
                        .foregroundColor(Color("lightBlue"))
                        .background(Color("midBlue"))
                        .cornerRadius(10)
                }
                .padding()
                
                if isReportSent {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color("midBlue"))
                        .font(.system(size: 40))
                    
                }
                //            Spacer()
            }
            .padding()
        }
    }

    func sendReport() {
        // Implement the logic to send the report
        print("Report sent: \(reportText)")

        isReportSent = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            isReportSent = false
            // Dismiss the view after the delay
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
