# MaaUma

基于 [MaaFramework](https://github.com/MaaXYZ/MaaFramework) 的赛马娘自动化项目骨架。

当前版本专注于把任务流程和资源目录搭好。识图模板、OCR 文案、模拟器包名等游戏相关数据统一使用 `TODO_` 占位，拿到实际截图后可以逐项替换。

## 目录

```text
assets/
  interface.json                 # Maa ProjectInterface V2
  resource/
    pipeline/                    # 任务流水线 JSON
    image/                       # 模板图
    model/ocr/                   # 可选 OCR 模型
docs/
  resource-placeholders.md       # 占位资源清单
scripts/
  sync-framework.ps1             # 更新本地 MaaFramework 参考源码
```

## 使用方式

1. 使用 MFAAvalonia 或其他 MaaFramework UI 加载本项目目录。
2. 连接 Android 模拟器，默认控制器按 16:9 横屏配置。
3. 在 `assets/resource/pipeline/` 中把 `TODO_` OCR 文案替换成实际游戏文字。
4. 按 `docs/resource-placeholders.md` 的清单补齐模板图，并删除对应节点中的占位说明。
5. 先单独运行“启动游戏并进入主界面”，再逐个启用育成和日常任务。

## MaaFramework 同步

官方框架源码已下载到本地的 `MaaFramework/` 目录，并被 `.gitignore` 排除。执行：

```powershell
.\scripts\sync-framework.ps1
```

可以从官方 GitHub API 更新本地参考源码。业务项目自身建议推送到你自己的 GitHub 仓库；拿到仓库 URL 后执行：

```powershell
git remote add origin <你的仓库地址>
git push -u origin main
```

## 免责声明

请确认自动化使用符合游戏服务条款及当地法律法规。项目只提供 MaaFramework 的任务配置骨架，不包含绕过安全验证或反作弊的功能。
