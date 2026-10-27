# 已知問題

## 需先修正

原碼最後使用 `ssget "X"` 取得全圖 HATCH 交由 HATCHEDIT，可能處理既有填充。需把選集限制為本次匯入的新物件，並在目標 AutoCAD 版本測試 PDFIMPORT 命令提示與選項流程。

## 使用限制

原碼最後用 ssget X 取得全圖 HATCH 執行 HATCHEDIT，範圍不限本次匯入。這是需優先調整的已知問題；不能保證掃描影像 PDF 可轉成向量填充，也沒有經驗證的速度數據。

需要可讀取的 PDF 與可用的 -PDFATTACH、-PDFIMPORT 指令；此流程的命令提示相容性待實機確認。

本次保留原始碼位元組，未修補功能；上述來源觀察不等於 AutoCAD 實機驗證結果。[返回 README](../README.md)。
