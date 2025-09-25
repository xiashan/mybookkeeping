# Copilot Instructions for mybookkeeping (Flutter)

## 项目架构概览
- 本项目为 Flutter 多平台应用，主入口为 `lib/main.dart`，采用 Provider 状态管理。
- 主要目录：
  - `lib/`：核心业务逻辑与 UI 组件。
  - `test/`：Widget 测试用例，使用 `flutter_test`。
  - 平台相关目录（`android/`, `ios/`, `macos/`, `linux/`, `windows/`, `web/`）用于多端构建。
- 依赖管理通过 `pubspec.yaml`，常用包有 `provider`、`english_words`。

## 关键开发流程
- **构建与运行**：
  - 构建/运行命令：`flutter run`（自动检测平台），或指定平台如 `flutter run -d macos`。
  - 构建 release 包：`flutter build <platform>`，如 `flutter build apk`、`flutter build ios`。
- **测试**：
  - 单元/Widget 测试：`flutter test`，测试文件位于 `test/` 目录。
- **静态分析与规范**：
  - 代码规范由 `analysis_options.yaml` 配置，启用部分 Flutter 官方 lint。
  - 推荐使用单引号（`prefer_single_quotes`），部分 const/immutable 相关 lint 已关闭。

## 项目约定与模式
- **Provider 用法**：
  - 状态管理统一通过 Provider，入口在 `MyApp` 的 `ChangeNotifierProvider`。
  - 状态类如 `MyAppState` 需继承 `ChangeNotifier`，通过 `notifyListeners()` 触发 UI 更新。
- **UI 结构**：
  - 主页面为 `MyHomePage`，通过 `context.watch<MyAppState>()` 获取状态。
  - 推荐将业务组件拆分为独立 Widget，便于复用与测试。
- **测试模式**：
  - 测试用例采用 `testWidgets`，建议模拟用户交互（如 tap、pump）。

## 集成与依赖
- 依赖包需在 `pubspec.yaml` 中声明，安装用 `flutter pub get`。
- 平台相关配置分别在对应目录下（如 `android/app/build.gradle.kts`、`ios/Runner/Info.plist`）。

## 重要文件参考
- `lib/main.dart`：应用入口与 Provider 配置。
- `test/widget_test.dart`：Widget 测试示例。
- `analysis_options.yaml`：代码规范与 lint 配置。
- `pubspec.yaml`：依赖与项目元信息。

## 其他说明
- 本项目未启用特殊 agent 规则文件（如 `.cursorrules`），所有约定以本说明和 `analysis_options.yaml` 为准。
- 代码注释建议采用中英文混合，便于团队协作。

---
如有不清楚或遗漏的部分，请反馈以便补充完善。
