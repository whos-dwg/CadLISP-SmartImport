# SMARTIMPORT 首次預覽發行說明草稿

附加 PDF 第一頁為底圖，再以 PDFIMPORT 設定嘗試匯入單色填滿並保留底圖。

- 指令：SMARTIMPORT。
- 相依與設定：需要可讀取的 PDF 與可用的 -PDFATTACH、-PDFIMPORT 指令；此流程的命令提示相容性待實機確認。
- 驗證：完成來源與文件靜態檢查；AutoCAD 實機回歸待完成。
- 已知事項：原碼最後使用 `ssget "X"` 取得全圖 HATCH 交由 HATCHEDIT，可能處理既有填充。需把選集限制為本次匯入的新物件，並在目標 AutoCAD 版本測試 PDFIMPORT 命令提示與選項流程。
- 授權：MIT，Copyright (c) 2026 whos-dwg。

本次保留來源位元組；發布時請按實際修補及測試結果更新這份說明。[完整操作](README.md)。
