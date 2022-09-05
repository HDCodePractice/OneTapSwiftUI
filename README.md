# OneTapSwiftUI
SwiftUI一点通，您现在可以通过[TestFlight下载App](https://testflight.apple.com/join/smdKSsBL)。我会定期将版本发布到TestFlight上，历史版本可以在[Releases](https://github.com/HDCodePractice/OneTapSwiftUI/releases)中看到。

## 贡献 Tap

- 请前往[Apple SwiftUI索引](https://developer.apple.com/documentation/swiftui)了解分类，请将相应的View放入对应的Folder下
- 每个Tap的名字应为 *Viewname*ControlView.swift
- 每个Tap应该将不同的使用方式尽可能的展现出来，比如init时的参数以及常用的modifier，参见[VStackControlView.swift](https://github.com/HDCodePractice/OneTapSwiftUI/blob/main/OneTapSwiftUI.swiftpm/LayoutContainers/VStackControlView.swift)
- 每个Tap如果你有了很不同的使用方式，欢迎增加不同的乐趣代码参见[ZStackDiceView.swift](https://github.com/HDCodePractice/OneTapSwiftUI/blob/main/OneTapSwiftUI.swiftpm/LayoutContainers/ZStackDiceView.swift)

### 项目所使用的公用组件

所有的公用View组件均在Components文件夹下，所有公用Model均在Model文件夹下。

### 运行

- 你可以通过[TestFlight下载测试版本](https://testflight.apple.com/join/smdKSsBL)
- 也可以使用Swift Playgrounds打开swiftpm来查看和运行