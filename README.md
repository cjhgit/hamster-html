# Canvas 仓鼠

基于本目录 `hamster.swf` 的原始 ActionScript 2 逻辑移植，用 HTML Canvas 绘制。运行时不加载 SWF、Ruffle 或远程脚本，无需 Flash 插件。保留 aBowman 原署名。

在线体验：https://cjhgit.github.io/hamster-html/

## 运行

直接用浏览器打开 `index.html` 即可；也可运行：

```sh
npm start
```

访问 http://localhost:5173 。支持手机触摸，画面按原比例缩放。

## 交互

- 移动鼠标：仓鼠会注意、追随鼠标，靠近高处时站起。
- 点击空白处：投下一粒食物。按住可移动，松开后按重力下落，移动中松手可抛出。
- 仓鼠会寻找食物、嗅闻、抱住啃食，最多同时保留 10 粒，吃掉后可继续投食。
- 点击黄色轮心：让仓鼠走上跑轮。跑轮有惯性，仓鼠会疲劳、休息、自行上下轮。
- 无操作时会随机走动、转头、洗脸、眨眼、口渴喝水，并在长时间空闲后睡眠；移动鼠标可唤醒。
- 点击 aBowman 署名可访问原作者页面。

原 SWF 的颜色参数仍可通过地址查询参数设置，例如 `?up_bodyColor=E6DEBE&up_wheelOuterColor=E33332`。支持背景、身体、耳朵、口鼻、眼睛、脚、尾巴、水、食物及跑轮的 13 项颜色参数。

## 来源与实现

- `analysis/scripts/`：从用户提供的 SWF 用 JPEXS 26.3.0 反编译得到的全部 8 个脚本，保留以便逐项核对。
- `src/original.js`：从上述脚本机械转换而来的绘图、行为、物理算法。
- `src/runtime.js`：原程序实际用到的 MovieClip 图层、路径、遮罩、文本及计时器的 Canvas 实现。
- `src/app.js`：30 FPS 时间步、输入坐标映射、触摸输入与截图外框。
- `assets/`：从 SWF 提取的原版署名字体。
- `analysis/NOTES.md`：分析依据、交互映射与验证范围。

修改反编译脚本或转换规则后，运行 `npm run build` 重新生成 `src/original.js`。

## 验证

```sh
npm install
npx playwright install chromium
npm start
# 另一个终端
npm test
```

可通过 `CHROME_PATH` 指定本机 Chromium 可执行文件。验证覆盖浏览器真实指针事件、食物物理、全部行为状态、约 9 分钟时间推进、食物回收、窄屏布局、13 项颜色参数、舞台裁剪、署名链接、跑轮描边尺寸及独立于动画帧的计时器。

本项目包含原作者的代码移植与字体；不将这些资源声明为原创或重新授予许可。

## GitHub Pages

Pages 从 `main` 分支根目录发布，`.nojekyll` 禁用 Jekyll 处理。页面、脚本和字体均使用相对路径，可直接部署在 `/hamster-html/` 子路径。
