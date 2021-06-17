//
//  ContentView.swift
//  swiftUI-04-list
//
//  Created by student on 2021/6/17.
//

import SwiftUI
struct person:Identifiable {
    var name:String
    var id = UUID()
    var address:String
    
    
}
struct ContentView: View {
    var datasource = [person(name: "zhangsan", address: "安徽商贸"),person(name: "lishi", address: "安徽商贸"),person(name: "wwanagwu", address: "安徽商贸"),person(name: "zhaoliu", address: "安徽商贸")]
    
    var body: some View {

        
        List{
            ForEach(datasource){person in
                HStack{
                    VStack(alignment:.leading){
                        Text(person.name)
                            .font(.title)
                        Text(person.address)
                            .foregroundColor(.red)
                    }
                    Spacer()
                    
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                }
                
               
            }
            

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
