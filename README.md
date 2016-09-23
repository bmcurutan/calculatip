# Pre-work - Calculatip

Calculatip is a tip calculator application for iOS.

Submitted by: Bianca Curutan

Time spent: 4 hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Launch screen with image and title
- [x] Calculating the remembered bill amount immediately on launch
- [x] Added split functionality for up to 4 people
- [x] Remembering the tip percentage and split 
- [x] Reset Settings for tip and split

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/link/to/your/gif/file.gif' title='Calcutip Video Walkthrough' width='' alt='Calcutip Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

- I came across some design challenges. Since only basic guidelines were provided, I was trying to think of ways to make the functions seem more interesting without making the app look too bare.
- Testing on different iPhone models as well as iPad sometimes yielded unexpected results for the UI. However, since this was developed primarily as an iPhone app, I didn't expect the design to transfer over to iPad easily anyway, but I did make some UI adjustments for the large iPhone sizes.
- Rather than using the user defaults standards to save data across different view controllers, I experimented with passing data in other ways, such as using global variables. Since this is a multi-thread environment, this way sometimes worked but sometimes didn't.


## License

    Copyright 2016 Bianca Curutan

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
