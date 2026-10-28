# UMAPM iOS SDK · Swift Package Manager

友盟+应用性能监控组件 UMAPM 的 Swift Package Manager 分发仓库。

## 版本对应关系

| SwiftPM tag | UMAPM |
| --- | --- |
| `2.1.9` | `2.1.9` |

## 环境要求

- iOS 12.0 及以上。
- Xcode 14.0 及以上（Package.swift 使用 Swift tools 5.7）。
- 支持 arm64 真机，以及 arm64 / x86_64 iOS 模拟器。

## 依赖说明

UMAPM 依赖 UMCommon，但本包不会自动引入 UMCommon。集成 UMAPM 时，必须同时添加 [UMCommon Swift Package](https://github.com/umeng/umcommon-ios-spm.git) 的 `UMCommon` product。

本包已自动链接 `libc++`，无需手动添加 `libc++.tbd`。

## Xcode 集成

1. 打开工程，选择 **File → Add Package Dependencies**。
2. 分别添加以下两个仓库地址：

   ```text
   https://github.com/umeng/umapm-ios-spm.git
   https://github.com/umeng/umcommon-ios-spm.git
   ```

3. 依赖规则选择 **Exact Version**，UMAPM 填写 `2.1.9`。
4. 将以下两个 product 添加到 App Target：
   - `UMAPM`
   - `UMCommon`

## Package.swift 集成

在现有包的 `dependencies` 中分别添加 UMAPM 和 UMCommon：

```swift
.package(url: "https://github.com/umeng/umapm-ios-spm.git", exact: "2.1.9"),
.package(url: "https://github.com/umeng/umcommon-ios-spm.git", from: "7.7.0")
```

在使用 SDK 的 target 的 `dependencies` 中添加：

```swift
.product(name: "UMAPM", package: "umapm-ios-spm"),
.product(name: "UMCommon", package: "umcommon-ios-spm")
```

Swift 代码中使用：

```swift
import UMAPM
import UMCommon
```

SDK 初始化及接口使用请参考友盟官方文档。

## 许可

SDK 为友盟版权所有的闭源二进制组件，使用须遵循友盟 SDK 相关协议。
