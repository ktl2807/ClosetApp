//
//  ContentView.swift
//  OOTD
//
//  Created by sand liao on 07/06/2022.
//

import SwiftUI

struct ClothesView: View {
    @State var clothes:Clothes
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var clothesStorage: ClothesStorage
    let newClothes : Bool
    let clothesIndex: Int
    @State var addClothesImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    
    var body: some View {
        
        List {
            ZStack{ RoundedRectangle(cornerRadius: 0.3).frame(width: 325, height: 400, alignment: .center).foregroundColor(Color.white)
    
                    VStack {
                        SectionTitle(title: "Add your clothes")
                        Button(action:{
                            addClothesImage = true
                            openCameraRoll = true
                            
                            
                        }){
                            if( addClothesImage){
                                Image(uiImage: imageSelected).resizable().frame(width: 400, height: 400)
                            } else {
                                Image(systemName: "plus").resizable().frame(width: 50, height: 50,alignment: .center)
                            }
                            
                            
                            
                        }.sheet(isPresented: $openCameraRoll){
                            ImagePicker( selectedImage: $imageSelected, sourceType: .photoLibrary)
                        }
                    }
                }
                Section {
                    TextField("Name Your Clothing.", text: $clothes.title)
                }
                Section{
                    SectionTitle(title: "Frequency")
                    HStack{
                        Text(String(repeating:"*", count:Int(clothes.freqency)))
                            .font(.title)
                            .foregroundColor(Color.yellow)
                    }
                    Slider(value:$clothes.freqency, in:0...5, step: 1)
                }
                Section{
                    SectionTitle(title: "What's the type of your clothing?")
                    HStack{
                        VStack{
                        Toggle(isOn: $clothes.top){
                            if(clothes.top){
                                Text("👚")
                            }else{
                                Text("Top").foregroundColor(Color.gray)
                            }
                        }
                        Toggle(isOn: $clothes.bottom){
                            if(clothes.bottom){
                                Text("👖")
                            }else{
                                Text("Bottoms").foregroundColor(Color.gray)
                            }
                        }
                        }
                        VStack{
                        Toggle(isOn: $clothes.acc){
                            if(clothes.acc){
                                Text("👟")
                            }else{
                                Text("Shoes").foregroundColor(Color.gray)
                            }
                        }
                        Toggle(isOn: $clothes.shoes){
                            if(clothes.shoes){
                                Text("💍")
                            }else{
                                Text("Accessories").foregroundColor(Color.gray)
                            }}
                        }}
                    Section {
                        TextField("Material", text: $clothes.material)
                    }
                    Section {
                        TextField("Washing Notice", text: $clothes.washingNotice)
                    }
                    Section{
                        Button(action:{
                            if (newClothes){
                                clothesStorage.clothes.append(clothes)
                                clothesStorage.saveData()
                            }
                            self.presentationMode.wrappedValue.dismiss()}){
                                HStack{
                                    Spacer()
                                    Text("Save")
                                    Spacer()
                                }
                            }
                    }
                    if(!newClothes){
                        Section{
                            Button(action:{
                                if !newClothes{
                                    print(clothes.id)
                                    clothesStorage.clothes.remove(at: clothesIndex)
                                    clothesStorage.saveData()
                                }
                            }){
                                HStack{
                                    Spacer()
                                    Text("Delete")
                                    Spacer()
                                }
                            }
                        }
                    }
                }
        }
        }
    
}
struct SectionTitle:View{
    var title:String
    var body: some View {
        Text(title).font(.caption).fontWeight(.bold).foregroundColor(Color.brown)
    }
    
}

struct ClothesView_Previews: PreviewProvider {
    static var previews: some View {
        ClothesView(clothes:Clothes(),clothesStorage:ClothesStorage(),newClothes: true, clothesIndex: 0)
    }
}
