# Utils
A utility package.


## SwiftBackwardArrow
The `<-` operator.

Allows to write shorter code:
```swift
let foo: SomeClass = .init() <- {
    $0.bar = "bar"
    $0.taz = "taz"
}
```
instead of 
```swift
let foo: SomeClass = makeFoo()
func makeFoo() -> SomeClass {
    let foo = SomeClass()
    foo.bar = "bar"
    foo.taz = "taz"
    return foo
}
```

## UIKitConstraints
A utilities related to the AutoLayout contraints.

### CustomConstraints
`@CustomConstraints` property wrapper sets `translatesAutoresizingMaskIntoConstraints` to `false`.

### Constraints Equations DSL
Allows to write shorter code for `NSLayoutConstraints`:
```swift
NSLayoutConstraints.activate {
    parentView.leadingAnchor == childView.leadingAnchor
    parentView.topAnchor == childView.topAnchor
    parentView.trailingAnchor == childView.trailingAnchor
    parentView.bottomAnchor == childView.bottomAnchor
}
```
instead of
```swift
NSLayoutConstraints.activate([
    parentView.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
    parentView.topAnchor.constraint(equalTo: childView.topAnchor),
    parentView.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
    parentView.bottomAnchor.constraint(equalTo: childView.bottomAnchor),
])
```

## UIKitReusable
Similar to [AliSoftware/Reusable](https://github.com/AliSoftware/Reusable) but bound to `UITableView`/`UICollectionView`
API only (i.e. has nothing to do with XIBs and storyboards).
