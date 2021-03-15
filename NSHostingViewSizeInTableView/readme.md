# Self Sizing Table View Cells containing SwiftUI views on macOS

When using automatic row sizing on NSTableView and the cells contain SwiftUI views with text, things get slightly unpredictable.

If a cell’s content just attempts to lay text out, it was always truncate to the smallest size possible:
<img src="Figure%201.png" alt="Figure 1" style="zoom:50%;" />

However, when using the `fixedSize` modifier on the text (or int he view at all), the `NSHostingView` starts providing auto layout with a minimum height which doesn’t match to the SwiftUI view’s content:
<img src="Figure%202.png" alt="Figure 2" style="zoom:50%;" />

Xcode shows the following for the Hosting View (752):
<img src="Figure%203.png" alt="Figure 3" style="zoom:50%;" />

While the SwiftUI view’s content is only 64:
<img src="Figure%204.png" alt="Figure 4" style="zoom:50%;" />

This same thing occurs when using a `NSHostingController` instead of a `NSHostingView`