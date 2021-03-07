
# Interactions of lazy stacks and lazy grids in SwiftUI

Experiment to observe the intreractions of lazy stacks and lazy grids in SwiftUI.

The app concept is to list a number of lamp switching records in different rooms.

The scrolling list is implemented as a:

*  `List` and

* `ScrollView` with a `LazyVStack`.

The row has two different implementations: 

* based on `VStack`s and `HStack`s, as seen [here](https://github.com/atineoSE/LampMonitor/blob/main/LampMonitor/StackLampRow.swift#L24)
* based on `LazyVGrid` with 2 columns, as seen [here](https://github.com/atineoSE/LampMonitor/blob/main/LampMonitor/LazyGridLampRow.swift#L26)

This video capture shows the scrolling behavior when using each of the 4 combinations, namely:

* `List` with `VStack`/`HStack`-based rows &rarr; ✅
* `List` with `LazyVGrid`-based rows &rarr; ✅
* `ScrollView`+`LazyVStack` with `VStack`/`HStack`-based rows &rarr; ✅
* `ScrollView`+`LazyVStack` with `LazyVGrid`-based rows &rarr;❌

![Scrolling of lamp records](https://user-images.githubusercontent.com/12340433/110236989-a307e880-7f39-11eb-9ca7-5b910be61960.mp4 "Scrolling of lamp records")

Combining lazy stacks with lazy grids seems to result in a glitchy experience for the scrolling of rows. However, the same lazy grids work alright inside a `List`. 

Here is a slow-motion capture of the scrolling behavior when combining a `LazyVStack`-based list with `LazyVGrid`-based rows.

![Slow-motion scroll when combining lazy stack and lazy grid](https://user-images.githubusercontent.com/12340433/110236998-ac915080-7f39-11eb-9d6c-086990407657.mp4 "Slow-motion scroll when combining lazy stack and lazy grid")

## Is this a SwiftUI bug?

Is this a SwiftUI bug or the result of an unsupported combination of UI elements? 

In WWDC'2020 session on "[Stack, Grids, and Outlines in SwiftUI](https://developer.apple.com/wwdc20/10031)", it is said:

> On the other hand, making the stacks [...] lazy doesn't actually confer any benefits. The content is all visible at once as soon as the view lands on screen. So, everything has to be loaded at once, regardless of the container's default behavior. As a rule, if you aren't sure which type of stack to use, use VStack or HStack.

The intended use of a lazy stack is to help with performance bottlenecks related to content that is not visible all at once on the screen. In this example, each row in the lamp record is visible all at once, so we don't really need the lazy behavior benefits. 

In that case, we can use `VStack` and `HStack` instead. However, there is no regular (i.e non-lazy) counterpart for a Grid element. All we have is a `LazyVGrid` and `LazyHGrid`. It looks like we can't leverage these lazy layouting primitives for inner UI elements inside of other lazy containers, despite the principle that states that:

> SwiftUI's layout primitives were designed with composition in mind

