## 軟體短訊 – mimetex 數學式繪製程式

mimetex 是一個用來將 Tex 數學式轉換為圖片的程式，可以在命令列使用，
但更常被編譯成 cgi 程式，然後用來在 HTML 的 `<img src='...'/>` 標記中顯示數學式的圖片。

執行範例：

```
$gcc -DAA mimetex.c gifsave.c -lm -o mimetex.cgi
$gcc -DAA mimetex.c gifsave.c -lm -o mimetex
$mimetex -d "x^2+y^2" > exp.gif
```

網路上除了 mimetex 可以用來顯示數學式之外，還有不少可以在網頁上顯示數學式的軟體，像是 MathJax, jsmath 等，另外
現在的瀏覽器通常也有內建 MathML 的顯示功能。

Google 在其 Chart API 當中也有提供類似 mimetex 的服務，您可以用像下列語法顯示數學式，其中的 etex 是 Tex 數學式編碼為 URL 的字串。

```
<img src="http://chart.apis.google.com/chart?cht=tx&amp;chl=[tex]"/>
```

### 參考文獻
* Mimetex 的下載、編譯及用法請參考 -- <http://www.forkosh.com/mimetexmanual.html>
* [PmWiki - 利用 MimeTeX 顯示數學式](http://banco.pixnet.net/blog/post/1824524-pmwiki---%E5%88%A9%E7%94%A8-mimetex-%E9%A1%AF%E7%A4%BA%E6%95%B8%E5%AD%B8%E5%BC%8F)

【本文由陳鍾誠撰寫】
