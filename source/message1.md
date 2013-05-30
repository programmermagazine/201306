## 軟體短訊 – ImageMagick 影像處理工具

ImageMagick 是一個用於查看、編輯、組合或轉換影像的工具軟體集合。它可以讀取超過 100 種影像格式 
(包含 GIF, JPEG, PDF, PNG, SVG, TIFF, PDF, Postscript, DPX, EXR, PhotoCD 等)，採用類似 Apache 2.0 的開放原始碼授權方式。

ImageMagick 主要由大量的命令列程序組成，而不是採用 Adobe Photoshop、GIMP 這樣的圖形界面，因此很適合在程式裏被呼叫，是程式人的好幫手！

您可以用 ImageMagic 來「更改圖片大小、鏡射、旋轉、扭曲、變形、轉換影像，或者調整顏色、加上某些特效、
或者將文字、線條、多邊形、橢圓、貝氏曲線等圖形畫在圖片上」。

許多程式語言或平台都提供了 ImageMagick 的 API 函式庫，像是 Ada 的 G2F、C 的 MagickCore, MagickWand、
Ch 的 ChMagick、COM+ 的 ImageMagickObject、C++ 的 Magick++、Java 的 JMagick、Lisp 的 L-Magick、微軟 .NET 的 MagickNet、Pascal 的 PascalMagick、
Perl 的 PerlMagick、PHP 的 MagickWand, IMagick、Python 的 PythonMagick、Ruby 的 RMagick 與 Tcl/TK 的 TclMagick 等。

很多程式使用 ImageMagick 創建縮圖，例如 MediaWiki、phpBB 和 vBulletin 等都是，另外也有不少程式 (如 LyX) 用 ImageMagick 來轉換圖片格式。

在使用者介面上，ImageMagick 也提供了一個基於 X Window 的簡易 GUI：IMDisplay。它還為很多程序語言提供了函式庫。

### 工具程式集

以下是一些 ImageMagick 的工具程式：

* [compare] : mathematically and visually annotate the difference between an image and its reconstruction.
    * 比較：顯示兩張影像的差異，以便使用者進行影像對比。
* composite : overlap one image over another.
    * 組合：將一張影像疊在另一張上面。
* conjure : interpret and execute scripts written in the Magick Scripting Language (MSL).
    * 變戲法：執行 MSL 腳本語言。
* convert : convert between image formats as well as resize an image, blur, crop, despeckle, dither, draw on, flip, join, re-sample, and much more.
    * 轉換：影像格式轉換，並可作模糊、去斑、更改大小、繪圖、翻轉、剪切、連接、重新取樣等動作。
* identify : describe the format and characteristics of one or more image files.
    * 鑑定 ：顯示影像的基本資訊
* mogrify : (覆蓋) resize an image, blur, crop, despeckle, dither, draw on, flip, join, re-sample, and much more. Mogrify overwrites the original image file,
whereas, convert writes to a different image file.
    * 覆蓋：與轉換 convert 功能類似，但 mogrify 會直接覆蓋在原檔案上 (節省空間)。
* montage : create a composite image by combining several separate images. The images are tiled on the composite image optionally adorned with a border, frame, image name, and more.
    * 蒙太奇：
* stream : a lightweight tool to stream one or more pixel components of the image or portion of the image to your choice of storage formats. It writes the pixel components as they are read from the input image a row at a time making stream desirable when working with large images or when you require raw pixel components.
    * 串流：

另外還有幾個與 X server 有關的程式如下：

* animate : (動畫) animate an image sequence on any X server.
* display : (顯示) display an image or image sequence on any X server.
* import : (匯入) save any visible window on an X server and outputs it as an image file. You can capture a single window, the entire screen, or any rectangular portion of the screen.

使用範例：

```
$ convert rose.gif rose.jpg // 將 gif 檔轉為 jpg 格式。
$ convert rose.jpg -sharpen 0x1 reconstruct.jpg
$ compare rose.jpg reconstruct.jpg difference.png
$ compare -compose src rose.jpg reconstruct.jpg difference.png
```

ImageMagick 已經是廣為使用的影像處理工具，甚至有幾本 ImageMagick 的專書，詳細的告訴您如何使用 ImageMagick 呢？列舉如下：

* [ImageMagick Tricks: Unleash the power of ImageMagick with this fast, friendly tutorial and tips guide](http://www.amazon.com/exec/obidos/tg/detail/-/1904811868/qid=1123551819/sr=8-1/ref=pd_bbs_sbs_1?v=glance&s=books&n=507846)
* [The Definitive Guide to ImageMagick (Definitive Guides)](http://www.amazon.com/exec/obidos/tg/detail/-/1590595904/qid=1123551819/sr=8-1/ref=pd_bbs_sbs_1?v=glance&s=books&n=507846)

[compare]:http://www.imagemagick.org/script/compare.php


### 參考文獻

* <http://www.imagemagick.org/script/command-line-tools.php>
* <http://www.imagemagick.org/script/index.php>
* <http://zh.wikipedia.org/zh-tw/ImageMagick>
    
【本文由陳鍾誠取材並修改自維基百科】

