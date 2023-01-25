//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Jiayi on 1/25/23.
//

import SwiftUI

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    var skipAction: ()->Void
    
    private var speakerNumber: Int? {
        /**
         $0 is a shortcut to mean "first argument" in a closure.
         let even = digits.filter { $0 % 2 == 0 }
         let even = digits.filter { val in val % 2 == 0 }

         let digits = [1,4,10,15]
         let even = digits.filter { $0 % 2 == 0 }
         let odd = digits.filter { val in val % 2 == 1 }
         print("even", even)
         print("odd", odd)

         will produce

         even [4, 10]
         odd [1, 15]
         */
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil}
        return index + 1
    }
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted }
    }
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else { return "No more speakers" }
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    
    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Last Speaker")
                } else {
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName:"forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers,  skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}
