//
//  SampleContentTabView.swift
//  NavigationBar
//
//  Created by Felipe Espinoza on 12/10/2022.
//

import SwiftUI

struct SampleContentTabView: View {
    @State var name: String = "sample"
    @State var color: Color = .yellow
    var onHello: (() -> Void)?

    var body: some View {
        VStack {
            Spacer()

            Text(name)

            Spacer()

            if let onHello {
                Button("Hello World", action: { onHello() })
                    .buttonStyle(.borderedProminent)
                    .tint(Color.red)
            }

            NavigationLink {
                SampleContentTabView(name: "\(name) nested", color: .brown)
            } label: {
                HStack {
                    Text("Go to child")
                        .bold()
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding(8)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(color)
        .navigationTitle("\(name) view")
    }
}

struct SampleContentTabView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SampleContentTabView()
        }
    }
}
