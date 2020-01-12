//
//  ItemRow.swift
//  iDine
//
//  Created by Abhijeet Aher on 1/11/20.
//  Copyright © 2020 Abhijeet Aher. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    var item : MenuItem
    static let colors: [String: Color] = ["D": .purple , "G" : .black , "N" : .red , "S" : .blue , "V" : .green]
    
    var body: some View {
        HStack{
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray , lineWidth: 2.0))
            
            VStack(alignment:.leading){
                Text(item.name)
                Text("$\(item.price)")
 
            }
            Spacer()
            ForEach(item.restrictions, id:\.self){ restriction in
                Text(restriction)
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(5)
                    .background(ItemRow.colors[restriction])
                    .clipShape(Circle())
            }
            
            
            
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
  let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")

    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
