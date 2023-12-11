//
//  TabPage.swift
//  Challenge
//
//  Created by Maryam Mohammad on 11/05/1445 AH.
//

import SwiftUI

struct TabPage: View {
    @State  var isSheetShowing = false
    var body: some View {
        TabView{
            
            HomePage()
                .tabItem {
                    Image(systemName: "house.fill")
                        
                }
            
            Community()
                .tabItem {
                    Image(systemName: "person.2.fill")
                }
            
            UserAccount()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    
                        
                }
            
        }.accentColor(Color("darkBlue"))
            .onAppear(){
                UITabBar.appearance().backgroundColor = UIColor.lightBlue
                UITabBar.appearance().unselectedItemTintColor = .midBlue
            }
        
        
    }
}

#Preview {
    TabPage()
}
