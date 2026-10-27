(defun c:SmartImport (/ pdfPath lastEnt)
  (setvar "CMDECHO" 1)
  (setq pdfPath (getfiled "選擇生產線 PDF 檔案" "" "pdf" 8))
  
  (if (and pdfPath (findfile pdfPath))
    (progn
      ;; 1. 置入底圖參考 (PDFATTACH) - 這是瞬間完成的，不讀取向量
      (command "_-pdfattach" pdfPath "1" "0,0,0" "1" "0")
      (setq lastEnt (entlast)) ; 取得剛剛放入的那個底圖物件
      (princ "\n[1/2] 底圖參考已置入...")

      ;; 2. 針對該底圖進行「去骨匯入」
      ;; 這裡會自動選取剛剛的物件，然後進入 Settings (S)
      (princ "\n[2/2] 正在提取色塊資料 (略過向量底圖)...")
      (command "_-pdfimport" lastEnt "S" 
               "V" "N"  ; 關鍵：Vector(向量幾何) -> No (不讀取，所以不會卡)
               "S" "Y"  ; Solid(單色填滿) -> Yes
               "T" "N"  ; Text(文字) -> No
               "R" "N"  ; Raster(影像) -> No
               ""       ; 結束設定
               "A"      ; All (匯入全部區域)
               "K"      ; Keep (保留底圖參考，讓你對照看)
      )
      
      ;; 3. (選配) 自動幫色塊補上邊界線，方便你算面積
      (command "_-hatchedit" (ssget "X" '((0 . "HATCH"))) "B" "P" "Y")
      
      (princ "\n完成！現在底圖是『參考』，彩色塊是『填充線』。")
    )
  )
  (princ)
)