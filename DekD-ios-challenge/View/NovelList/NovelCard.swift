//
//  NovelCard.swift
//  DekD-ios-challenge
//
//  Created by Simon Siwell on 6/11/2566 BE.
//

import SwiftUI

struct NovelCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("harry_cover")
                    .resizable()
                    .frame(width: 100, height: 125)
                    .cornerRadius(12)
                
                VStack(alignment: .leading) {
                    Text("order: 1")
                    Text("title: Harry Potter and the prisoner of Azkaban trilogy")
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    Text("type: ")
                    Text("author:")
                }
                .padding(.vertical)
                Spacer()
            } //: HStack

            // engangeView
            HStack {
                Text("Views: ")
                Text("Comments: ")
                Spacer()
            } //: HStack
            .padding(.vertical, 2)

            Text("Description: Looking for the best Harry Potter quotes that capture the magic of the series? The motley crew of wizards and witches at Hogwarts taught us about life, love, acceptance, friendship, death, and bravery from our book shelves and on the big screen, leaving us dozens of quotes and moments that still hold up to this day. If you couldn’t keep from smiling when you saw Harry, Hermione, and Ron reunite in the Gryffindor Common Room IRL and still get emotional when you think about the Battle of Hogwarts, you’re definitely not alone.")
                .multilineTextAlignment(.leading)
                .lineLimit(4)

            // tag
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Text("#tag1")
                    Text("#tag2")
                    Text("#tag3")
                }
            } //: tag

            Text("updated at:")
        } //: Main VStack
        .padding()
        .background(.white)
        .cornerRadius(4)
        .shadow(radius: 2)
    }
}

#Preview {
    NovelCard()
}
