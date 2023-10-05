//
//  AddView.swift
//  TodoList
//
//  Created by EDSON SANTOS on 05/10/2023.
//

import SwiftUI

struct AddView: View {
    @State var textFieldText: String = ""
    
    let backgroundColor = Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
    var body: some View {
        ScrollView{
            VStack {
                TextField(
                    "Type something here ...", text: $textFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(backgroundColor)
                .cornerRadius(10)
                
                Button(action: {
                    
                }, label: {
                    Text("Save" .uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖋️")
    }
}

#Preview {
    NavigationView{
        AddView()
    }
}
