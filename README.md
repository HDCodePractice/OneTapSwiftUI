# OneTapSwiftUI
SwiftUI一点通，您现在可以通过[TestFlight下载App](https://testflight.apple.com/join/smdKSsBL)。我会定期将版本发布到TestFlight上，历史版本可以在[Releases](https://github.com/HDCodePractice/OneTapSwiftUI/releases)中看到。

## 贡献 Tap

- 所有的Taps均在[SwiftUITapsPackage](https://github.com/HDCodePractice/SwiftUITapsPackage)中，如果使用Swift Playgrounds书写了新的Tap，你可以提交到本项目，如果是修改或使用Xcode，我们更希望您可以将相关的代码提交到[SwiftUITapsPackage](https://github.com/HDCodePractice/SwiftUITapsPackage)
- 请前往[Apple SwiftUI索引](https://developer.apple.com/documentation/swiftui)了解分类，请将相应的View放入对应的Folder下
- 每个Tap的名字应为 *Viewname*ControlView.swift
- 每个Tap应该将不同的使用方式尽可能的展现出来，比如init时的参数以及常用的modifier，参见[VStackControlView.swift](https://github.com/HDCodePractice/SwiftUITapsPackage/blob/main/Sources/SwiftUITapsPackage/LayoutContainers/VStackControlView.swift)
- 每个Tap如果你有了很不同的使用方式，欢迎增加不同的乐趣代码参见[ZStackDiceView.swift](https://github.com/HDCodePractice/SwiftUITapsPackage/blob/main/Sources/SwiftUITapsPackage/LayoutContainers/ZStackDiceView.swift)


## 开发一个Tap

### 使用Xcode Project

- clone [OneTapSwiftUI](https://github.com/HDCodePractice/OneTapSwiftUI) 和 [](https://github.com/HDCodePractice/SwiftUITapsPackage) 到同一个目录中
- 使用Xcode打开OneTapSwiftUI项目中的OneTapSwiftUIApp目录里的xcodeproj

### 使用 swiftpm

*注意事项*：Swift Playgrounds 4.1 还不支持SwiftUI 4.0 所以请使用 Xcode 14以上版本使用swiftpm

- clone [OneTapSwiftUI](https://github.com/HDCodePractice/OneTapSwiftUI)
- 使用Xcode打开swiftpm
- 你可以在swiftpm里完成新Tap的开发，我会帮你将新的Tap加入到Package中去的
- 在swiftpm中开发时，你需要显式的 `import SwiftUITapsPackage` 后就可以使用 `Components`和`Model`中的一系列组件了

### 项目所使用的公用组件

所有的公用View组件均在Components文件夹下，所有公用Model均在Model文件夹下。

### 运行

- 你可以通过[TestFlight下载测试版本](https://testflight.apple.com/join/smdKSsBL)
- 也可以使用Swift Playgrounds或Xcode打开swiftpm来查看和运行
- 当前也有一个Xcode项目用于支持App的编译发布

