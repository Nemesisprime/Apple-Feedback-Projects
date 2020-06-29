# Broken List Selection Binding in SwiftUI

At the moment, the List selection binding is broken regardless of the method you use.

This example project is best viewed on iPad with the split view completely expanded. When rows are selected, the value of the selection will be printed to console. When run and selecting the rows, something like this is the response: 

---

When using a List with both tags or an Identifiable object, the binding will only ever fire the first row's identifier (even when selecting other rows) and only a few times before only ever firing nil thereafter. 

![Console List Selection Output](console-list-selection-output.png)

When using NavigationLink(destination:tag:selection:), the proper selection is fired, but is always followed by two nil selections which clear the value from the source tracking selections: 

![Console NavLink Selection Nils](console-list-navlink-selection.png)

