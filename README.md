SuperLayout
===========

SuperLayout is a library that adds a few custom operators to Swift that makes using the new NSLayoutAnchor API in iOS 9 much less verbose and a pleasure to use. It doesn't override already-defined methods in `Equatable` (such as `==` and `>=`), like other frameworks do, and defines ones that are logical and easily understandable to anyone who might be inheriting your codebase or joining your team.

Summary
-------

First, this assumes you have a basic understanding of the [`NSLayoutAnchor` API](https://developer.apple.com/reference/uikit/nslayoutanchor). If not, read up. It's quite straightforward. Essentially, Auto Layout constraints are formed by creating relationships between _anchors_. For instance, let's say you have two buttons that you've added to a superview, and you want them to appear adjacent to each other, with the right of the first button attached to the left of the second. Here's how you might create a constraint using the original API.

Examples
--------

#### [constraint(equalTo:)](https://developer.apple.com/reference/uikit/nslayoutanchor/1500946-constraint)

➥ `viewA.rightAnchor ~~ viewB.leftAnchor`

<details>
  <summary>See original</summary>

  ```swift
  viewA.rightAnchor.constraint(equalTo: viewB.leftAnchor).isActive = true
  ```

</details>

---

#### [constraint(equalTo:constant:)](https://developer.apple.com/reference/uikit/nslayoutanchor/1500937-constraint)

➥ `viewA.rightAnchor ~~ viewB.leftAnchor + C`

<details>
  <summary>See original</summary>

  ```swift
  viewA.rightAnchor.constraint(equalTo: viewB.leftAnchor, constant: C).isActive = true
  ```

</details>

---

#### [constraint(greaterThanOrEqualTo:)](https://developer.apple.com/reference/uikit/nslayoutanchor/1500936-constraint)

➥ `viewA.rightAnchor ≥≥ viewB.leftAnchor`

<details>
  <summary>See original</summary>

  ```swift
  viewA.rightAnchor.constraint(greaterThanOrEqualTo: viewB.leftAnchor).isActive = true
  ```

</details>

---

#### [constraint(greaterThanOrEqualTo:constant:)](https://developer.apple.com/reference/uikit/nslayoutanchor/1500948-constraint)

➥ `viewA.rightAnchor ≥≥ viewB.leftAnchor + C`

<details>
  <summary>See original</summary>

  ```swift
  viewA.rightAnchor.constraint(greaterThanOrEqualTo: viewB.leftAnchor, constant: C).isActive = true
  ```

</details>

---

#### [constraint(lessThanOrEqualTo:)](https://developer.apple.com/reference/uikit/nslayoutanchor/1500953-constraint)

➥ `viewA.rightAnchor ≤≤ viewB.leftAnchor`

<details>
  <summary>See original</summary>

  ```swift
  viewA.rightAnchor.constraint(lessThanOrEqualTo: viewB.leftAnchor).isActive = true
  ```

</details>

---

#### [constraint(lessThanOrEqualTo:constant:)](https://developer.apple.com/reference/uikit/nslayoutanchor/1500959-constraint)

➥ `viewA.rightAnchor ≤≤ viewB.leftAnchor + C`

<details>
  <summary>See original</summary>

  ```swift
  viewA.rightAnchor.constraint(lessThanOrEqualTo: viewB.leftAnchor, constant: C).isActive = true
  ```

</details>

---

Likewise, you can set heights, widths, and add constants and multipliers just as with the standard Auto Layout API.

```swift
viewA.widthAnchor ~~ 50
```

<details>
  <summary>See original</summary>

  ```swift
  viewA.widthAnchor.constraint(equalToConstant: 50).isActive = true
  ```

</details>

```swift
viewA.widthAnchor ≥≥ viewA.widthAnchor * 1.2 + 20
```

<details>
  <summary>See original</summary>

  ```swift
  viewA.widthAnchor.constraint(greaterThanOrEqualTo: viewA.widthAnchor, multiplier: 1.2, constant: 20).isActive = true
  ```

</details>

```swift
viewA.centerYAnchor ~~ view.centerYAnchor - 20
```

<details>
  <summary>See original</summary>

  ```swift
  viewA.centerYAnchor.constraint(lessThanOrEqualTo: view.centerYAnchor, multiplier: 1, constant: -20).isActive = true
  ```

</details>

