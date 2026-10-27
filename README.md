# SMARTIMPORT PDF 底圖與填滿匯入

![SMARTIMPORT](assets/banner.svg)

[工具儲存庫](https://github.com/whos-dwg/CadLISP-SmartImport) · [全部工具索引](https://github.com/whos-dwg/CadLISP-Index)

附加 PDF 第一頁為底圖，再以 PDFIMPORT 設定嘗試匯入單色填滿並保留底圖。

**使用前需處理：** 原碼最後使用 `ssget "X"` 取得全圖 HATCH 交由 HATCHEDIT，可能處理既有填充。需把選集限制為本次匯入的新物件，並在目標 AutoCAD 版本測試 PDFIMPORT 命令提示與選項流程。

| 項目 | 內容 |
| --- | --- |
| 指令 | `SMARTIMPORT` |
| 檔案 | [smartimport.lsp](lsp/smartimport.lsp) |
| 分類 | 匯入與詳圖 |
| 狀態 | 有待修正的原碼問題 |
| 授權 | [MIT](LICENSE)，Copyright (c) 2026 whos-dwg |

[安裝](#安裝) · [操作](#操作) · [相依與設定](#相依與設定) · [已知問題](docs/KNOWN_ISSUES.md) · [驗證紀錄](docs/VALIDATION.md)

## 安裝

以 Windows 桌面版 AutoCAD 為目標。原碼使用的 Visual LISP／ActiveX、DCL 或原生命令，需在目標 AutoCAD 版本分別確認；尚未做整包年份、LT、Mac 或其他 CAD 的相容性認證。ActiveX 的平台限制見 [Autodesk](https://help.autodesk.com/cloudhelp/2026/ENU/AutoCAD-AutoLISP/files/GUID-A0459510-CE7A-4206-9EAA-E25AAB569B20.htm)。

1. 下載並解壓縮本工具到固定位置，先開啟測試圖面。
2. 依公司環境把 `lsp` 資料夾加入需要的支援搜尋路徑與受信任位置。
3. 輸入 `APPLOAD`，載入 `smartimport.lsp`；關閉視窗後輸入 `SMARTIMPORT`。

也可使用完整路徑單獨載入；下列路徑需依實際位置修改：

```lisp
(load "C:/CAD/CadLISP-SmartImport/lsp/smartimport.lsp")
```

完成驗證後，可將這支 LISP 加入 APPLOAD 的 Startup Suite。請維持既定的 SECURELOAD 政策，使用受信任位置處理載入限制。[SECURELOAD 說明](https://help.autodesk.com/cloudhelp/2026/ENU/AutoCAD-Core/files/GUID-541566C6-2738-49DD-87C3-C1490E924A02.htm)。

## 操作

1. 先另存副本，輸入 `SMARTIMPORT` 並選擇 PDF。
2. 程式以第一頁、原點、比例 1、旋轉 0 附加底圖，再執行匯入。
3. 核對填滿、底圖與邊界，確認原有 HATCH 是否受影響。

## 相依與設定

需要可讀取的 PDF 與可用的 -PDFATTACH、-PDFIMPORT 指令；此流程的命令提示相容性待實機確認。

圖面影響：新增 PDF 參考與匯入物件，可能對既有 HATCH 建立邊界。

## 行為與限制

原碼最後用 ssget X 取得全圖 HATCH 執行 HATCHEDIT，範圍不限本次匯入。這是需優先調整的已知問題；不能保證掃描影像 PDF 可轉成向量填充，也沒有經驗證的速度數據。

## 來源與授權

本工具依維護者確認為自行從零撰寫，或以 AI 協作從零開發。程式與本次文件採 [MIT 授權](LICENSE)，允許使用、修改與再散布，須保留授權及著作權聲明。詳細來源紀錄見 [provenance.json](metadata/provenance.json)。

## 回報與維護

回報時附 AutoCAD 完整版本、命令列錯誤與去識別的重現範例。修改前請閱讀 [CONTRIBUTING](CONTRIBUTING.md)；發行步驟見 [PUBLISHING](docs/PUBLISHING.md)。本工具可獨立維護、下載及發布，不依賴其他 CadLISP 工具儲存庫。
