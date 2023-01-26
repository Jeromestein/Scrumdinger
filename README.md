# Scrumdinger	

Scrumdinger, my first SwiftUI iOS app that helps users manage their daily scrums. To help keep scrums short and focused, Scrumdinger uses visual and audio cues to indicate when and how long each attendee should speak. The app also displays a progress screen that shows the time remaining in the meeting and creates a transcript that users can refer to later.

## Tour of the app

Many software engineering teams use daily meetings, known as scrums, to plan their work for the day. Scrums are short meetings where each attendee discusses what they accomplished yesterday, what they are working on today, and any obstacles that might impact their work.

### Scrum list

The main screen of the app displays a summary of each of the user’s daily scrums. Users can tap a row in the list to view the details of a scrum or create a new scrum by tapping the Add (+) button in the navigation bar.

![Screenshot of list of scrums under Daily Scrums heading](https://docs-assets.developer.apple.com/published/6998127a04d94761b6dbb9d30b96cbbd/SUI_000-002-001.png)

### Scrum detail and edit

The detail screen shows more information about a scrum, including the name of each attendee and a list of previous meetings. Users can modify any of the scrum’s attributes by tapping the Edit button. The edit screen includes a picker with which users can change the color theme of each meeting. Tapping the Start Meeting button at the top of the list starts a new meeting timer.

![Screenshot of scrum details shown in grouped lists, including Meeting info, Attendees, and History](https://docs-assets.developer.apple.com/published/ef299193e5390a7adec0b5a0cfbdcf0e/SUI_000-002-002.png)

### Meeting timer

The progress bar at the top of the meeting timer shows the elapsed and remaining time for the meeting. The app displays the name of the current speaker in the center of the screen and a button to advance to the next speaker at the bottom of the screen.

Segments in a circular progress ring represent each attendee. When an attendee uses all their time, Scrumdinger plays a “ding” sound and adds a new segment to the ring. The meeting ends when the ring is full.

![Screenshot of meeting timer screen with three main sections](https://docs-assets.developer.apple.com/published/25ea50a4093d09350dbc6eaf355f43ce/SUI_000-002-003.png)


## Future Work

1. Not working after going back to Home
2. Conflict between the ring (ding sound) and the voice recoding, so we have voice recoding but no ding in real iPhone, have ding but no recoding in iOS Simulator.
