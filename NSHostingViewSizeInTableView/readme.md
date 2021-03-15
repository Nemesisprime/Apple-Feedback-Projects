# Self Sizing Table View Cells containing SwiftUI views on macOS

When using automatic row sizing on NSTableView and the cells contain SwiftUI views with text, things get slightly unpredictable with the size of the hosting view.

If a cell’s content just attempts to render multiline text, it always truncates to the smallest size possible:
<img src="Figure%201.png" alt="Figure 1" style="zoom:50%;" />

When using the `fixedSize` modifier on the text (or on the view at all), the text no longer truncates:

<img src="Figure%202.png" alt="Figure 2" style="zoom:50%;" />

But the `NSHostingView` starts providing auto layout with a minimum height which doesn’t match to the SwiftUI view’s content resulting in cells (and owned hosting view) which are way larger than the SwiftUI's actual content:

<img src="Figure%203.png" alt="Figure 2" style="zoom:50%;" />

---

When debugging: Xcode shows the following for the Hosting View's minimum height constraint (752):
<img src="Figure%204.png" alt="Figure 3" style="zoom:50%;" />

**But** the SwiftUI view’s content height is actually only 64:

<img src="Figure%205.png" alt="Figure 4" style="zoom:50%;" />

This same thing occurs when using a `NSHostingController` instead of a `NSHostingView`