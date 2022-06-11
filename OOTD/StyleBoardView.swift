//
//  StyleBoardView.swift
//  OOTD
//
//  Created by sand liao on 08/06/2022.
//

import SwiftUI

struct StyleBoardView: View {
    @State var tag = ""
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 20).frame(width:350,height:500).foregroundColor(Color.black).opacity(0.6)
                Button(action: shareActionSheet){
                    Image(systemName: "square.and.arrow.up.circle.fill").resizable().aspectRatio(contentMode: .fit).frame(width:44,height:44).offset(x: 140, y: 220).foregroundColor(Color.white)
                
                }
            }
            ZStack{
                RoundedRectangle(cornerRadius: 10).frame(width:200,height: 50).foregroundColor(Color.black).opacity(0.6)
                TextField("Add Notes", text: $tag).foregroundColor(Color.black).frame(width: 100, height: 30).padding(.leading,40)
            }
            HStack{
            ZStack{
                
                RoundedRectangle(cornerRadius: 10).frame(width:100,height: 30).foregroundColor(Color.black).opacity(0.6)
                TextField("Add tags", text: $tag).foregroundColor(Color.white).frame(width: 100, height: 30).padding(.leading,30)
                
            }
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 10).frame(width:100,height: 30).foregroundColor(Color.black).opacity(0.6)
                    TextField("Add tags", text: $tag).foregroundColor(Color.white).frame(width: 100, height: 30).padding(.leading,30)
                    
                }
            }
        }
    }
}
func shareActionSheet() {
        guard let urlShare = URL(string: "https://developer.apple.com/xcode/swiftui/") else { return }
        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }

struct StyleBoardView_Previews: PreviewProvider {
    static var previews: some View {
        StyleBoardView()
    }
}
