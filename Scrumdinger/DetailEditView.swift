//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Jiayi on 1/24/23.
//

import SwiftUI

struct DetailEditView: View {
    
    /**
     data: DailyScrum.Data not data = DailyScrum.Data
     */
    @Binding var data: DailyScrum.Data
    /**
     Note

     Declare @State properties as private so they can be accessed only within the view in which you define them.
     */
    @State private var newAttendeeName = ""

    
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $data.title)
                HStack {
                    Slider(value: $data.lengthInMinutes, in: 5...30, step: 1) {
                        /**
                         Note

                         The Text view won’t appear on screen, but VoiceOver uses it to identify the purpose of the slider.
                         */
                        Text("Length")
                    }
                    .accessibilityValue("\(Int(data.lengthInMinutes)) minutes")
                    Spacer()
                    Text("\(Int(data.lengthInMinutes)) minutes")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $data.theme)
            }
            
            Section(header: Text("Attendees")) {
                ForEach(data.attendees) { attendee in
                    Text(attendee.name)
                }
                /**
                 The onDelete perform action pass IndexSet as an argument. This is the set of indices of items about to be deleted.
                 */
                .onDelete { indices in
                    data.attendees.remove(atOffsets: indices)
                }
                
                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            data.attendees.append(attendee)
                            /**
                             Because the text field has a binding to newAttendeeName, setting the value to the empty string also clears the contents of the text field.
                             */
                            newAttendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    /**
                     Communicating interaction states is important when displaying controls in a user interface. Adding this modifier prevents users from mistakenly saving an attendee without a name. The button will activate when the user types a name in the text field.
                     */
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(DailyScrum.sampleData[0].data))
    }
}
