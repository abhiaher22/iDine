//
//  ItemDetails.swift
//  iDine
//
//  Created by Abhijeet Aher on 1/11/20.
//  Copyright © 2020 Abhijeet Aher. All rights reserved.
//

import SwiftUI

struct ItemDetails: View {
    var item : MenuItem
    @EnvironmentObject var order : Order

    var body: some View {
        
        VStack{
            
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                
                Text("Photo: \(item.photoCredit)")
                    .padding(5)
                    .background(Color.black)
                    .foregroundColor(.white)
            }
            
            Text(item.description)
            
            Button("Order now"){
                self.order.add(item: self.item)
            }.font(.headline)
            
            Spacer()
            
        }.navigationBarTitle(Text(item.name) ,displayMode: .inline)
        
    }
}

struct ItemDetails_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView{
        ItemDetails(item: MenuItem.example)
        }
    }
}
