//
//  TopListView.swift
//  OOTD
//
//  Created by sand liao on 08/06/2022.
//

import SwiftUI


struct ClosetListView: View {
    @ObservedObject var clothesStorage = ClothesStorage()
    
    
    var body: some View {
        
        NavigationView{
            
            List{
                ForEach(Array(clothesStorage.clothes.enumerated()), id:\.offset){
                    index, currentCloth in
                    NavigationLink(destination:ClothesView(clothes: currentCloth, clothesStorage:clothesStorage, newClothes: false, clothesIndex: index)){
                        Text(currentCloth.title)
                    }
                }.onDelete{ (index) in self.clothesStorage.clothes.remove(atOffsets: index)}
            }.navigationBarTitle("Your Closet").foregroundColor(Color(red: 34/255, green: 68/255, blue: 119/255)).navigationBarItems(trailing:NavigationLink(destination: ClothesView(clothes:Clothes(), clothesStorage:clothesStorage, newClothes:true, clothesIndex: -1)){
                Image(systemName: "plus.circle.fill").resizable().frame(width: 30, height: 30, alignment: .topTrailing)
            })
            
            }
        
    }
}

struct ClosetListView_Previews: PreviewProvider {
    static var previews: some View {
        ClosetListView()
    }
}
