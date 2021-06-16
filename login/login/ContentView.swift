//
//  ContentView.swift
//  login
//
//  Created by student on 2021/6/16.
//

import SwiftUI

struct ContentView: View {
    @State var username:String = ""
    @State var password:String = ""
    var body: some View {
        ZStack{
            Color.gray
                .ignoresSafeArea()
            VStack{
                VStack(spacing:20){
                    
                    HStack{
                        Text("登陆：")
                        TextField("请输入用户名", text: $username)
                            .textFieldStyle( RoundedBorderTextFieldStyle())
                    }.padding()
                    HStack{
                        Text("登陆：")
                        TextField("请输入用户名", text: $password)
                            .textFieldStyle( RoundedBorderTextFieldStyle())
                    }.padding()
    //                Spacer()
                }
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.red).padding(.horizontal))
                Spacer()
            }


            
            VStack(alignment:.center){
                ZStack{
                    Circle()
                        .frame(width: 100, height: 100, alignment: .center)
                    HStack{
                        Rectangle()
                            .foregroundColor(Color.red)
                            .frame(width: 20, height: 20)
                            .padding()
                        Rectangle()
                            .foregroundColor(Color.red)
                            .frame(width: 20, height: 20)
                            .padding()
                    }
                }
                HStack{
                    Capsule()
                        .frame(width: 60)
                    Rectangle()
                    Capsule()
                        .frame(width: 60)
                }.padding(.horizontal)
                HStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 60)
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 60)
                }
            }.padding(.horizontal)
            .foregroundColor(.white)

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
