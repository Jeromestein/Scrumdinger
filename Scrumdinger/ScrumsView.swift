//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Jiayi on 1/24/23.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        List {
            ForEach(scrums) { scrum in
                CardView(scrum: scrum)
                    .listRowBackground(scrum.theme.mainColor)
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.sampleData)
    }
}
