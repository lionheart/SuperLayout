SuperLayout
===========

SuperLayout is a library that adds a few custom operators to Swift that makes using the new NSLayoutAnchor API in iOS 9 much less verbose and a pleasure to use. It doesn't override already-defined methods in `Equatable` (such as `==` and `>=`), like other frameworks do, and defines ones that are logical and easily understandable to anyone who might be inheriting your codebase or joining your team.

Summary
-------

First, this assumes you have a basic understanding of the `NSLayoutAnchor` API. If not, read up. It's quite straightforward. Essentially, Auto Layout constraints are formed by creating relationships between _anchors_. For instance, let's say you have two buttons that you've added to a superview, and you want them to appear adjacent to each other, with the right of the first button attached to the left of the second. Here's how you might create a constraint using the original API.

```swift
buttonA.rightAnchor.constraint(equalTo: buttonB.leftAnchor, constant: -10).isActive = true
```

-->

```swift
buttonA.rightAnchor ~~ buttonB.leftAnchor - 10
```

Likewise, you can set heights, widths, and add constants and multipliers just as with the standard Auto Layout API.

```swift
// Make `buttonA` 50px wide
buttonA.widthAnchor.constraint(equalToConstant: 50).isActive = true
```

-->

```swift
buttonA.widthAnchor ~~ 50
```


```swift
// Make the width of `buttonB` 1.2 times the width of `buttonA` + 20px
buttonA.widthAnchor.constraint(greaterThanOrEqualTo: buttonA.widthAnchor, multiplier: 1.2, constant: 20).isActive = true
```

-->

```swift
buttonA.widthAnchor ≥≥ buttonA.widthAnchor * 1.2 + 20
```


```swift
// Center on the Y-axis, offset by -50px
buttonA.centerYAnchor.constraint(lessThanOrEqualTo: view.centerYAnchor, multiplier: 1, constant: -20).isActive = true
```

-->

```swift
buttonA.centerYAnchor ~~ view.centerYAnchor - 20
```

Alright, you get the picture. Let's rewrite the above constraints using SuperLayout.
