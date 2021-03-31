# GuideScreen
 This is the screen that is displayed after the splash screen when the user installs the app for the first time. This screen gives a brief detail about the application.

## Note

Just change the object GuideScreenData Model Content.

Example :-     

private func setGuideScreenData() {
        guideScreenDataModel = [
            GuideScreenData(title: "Customized Media Training", description:  "This is a customizable media training platform that helps athletes be as prepared in front of the camera, as they are on the field.", image:#imageLiteral(resourceName: "guide1")),
            GuideScreenData(title: "Media Training On Your Schedule", description:  "Each training module can be individualized to fit any program or situation and completed on your own schedule with access to additional practice modules.", image: #imageLiteral(resourceName: "g2")),
            GuideScreenData(title: "Individualized Feedback", description:  "Each module will receive individualized feedback to help athletes learn to tell their own story and become more confident representing their team and community.", image: #imageLiteral(resourceName: "g3"))
        ]
    }
