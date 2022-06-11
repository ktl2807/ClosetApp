//
//  ClosetList.swift
//  OOTD
//
//  Created by sand liao on 08/06/2022.
//

import SwiftUI

struct MainPageView: View {
    @ObservedObject var clothesStorage = ClothesStorage()
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.black
        
    }
    
    var body: some View {
        
        TabView{
                
                
                ClosetListView().tabItem(){
                    Image(systemName: "bag.fill.badge.plus")
                    Text("Closet")
                }
                StyleBoardView().tabItem(){
                    Image(systemName: "tshirt.fill")
                    Text("Style Board")
                }
                CalendarView().tabItem(){
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
                OccassionView().tabItem(){
                    Image(systemName: "theatermasks.fill")
                    Text("Occassion")
                }

            
        }.myTabViewStyle().accentColor(Color(red: 166/255, green: 73/255, blue: 43/255))
        
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}

extension TabView {

    func myTabViewStyle() -> some View {
        self.background(Image("closet").resizable().scaledToFill().aspectRatio(contentMode: .fill).ignoresSafeArea(.all))
            .opacity(0.9)//
            
            

    }
}


