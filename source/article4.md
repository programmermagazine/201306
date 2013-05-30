## Verilog (1) – 以 Icarus 測試全加器 (作者：陳鍾誠)

在本系列的文章當中，我們將介紹如何用 Verilog 硬體描述語言設計電路，並且採用 Icarus 作為主要開發測試工具。

有了 Verilog 與電路設計的基礎之後，我們就可以在後續的文章中順利的銜接「開放電腦計畫」 的 CPU 設計這類的主題！

### Verilog 簡介

Verilog 與 VHDL 都是用來設計數位電路的硬體描述語言，但 VHDL 在1983年被提出後，1987　年被美國國防部和IEEE確定為標準的硬體描述語言。

Verilog 是由 Gateway Design Automation 公司於 1984 年開始發展的， Cadence Design Systems 公司於 1990 年購併了
 Gateway 公司，Cadence 隨後將 Verilog 提交到 Open Verilog International 成為開放公用標準，1995 年 Verilog 被
 IEEE 認可成為 IEEE 1364-1995 標準，簡稱為 Verilog-95。此一標準於 2001 年更新後成為 Verilog-2001。

相較於 VHDL 而言，Verilog 的語法較為簡潔，因此經常被專業的數位電路設計者採用，而 VHDL 的使用族群則有較多的初學者。當我們想學習數位電路設計時，經常會難以選擇要用哪一種語言，因為 VHDL 的書籍與教材似乎
比 Verilog 多一些，但是 Verilog 的高階設計電路（像是開放原始碼 CPU 等）則比 VHDL 多很多。

筆者是為了要設計 CPU 而學習數位電路設計的，因此決定學習 Verilog 語言，而非 VHDL 語言。雖然筆者也學過 VHDL 語言，但後來發現 Verilog 相當好，相對而言語法簡潔了許多，因此筆者比較偏好 Verilog 語言。

### Icarus : 開放原始碼的 Verilog 編譯執行工具

Icarus 是由 Stephen Williams 所設計的 Verilog 開發工具，採用 GPL 授權協議，並且可以在 Linux, BSD, OS X, MS Windows 等環境下執行。

Icarus 支援 Verilog 的 IEEE 1995、IEEE 2001 和 IEEE 2005 三種標準語法，也支援部分的 SystemVerilog 語法，其官方網站網址如下：

* <http://iverilog.icarus.com/>

如果您是 MS Windows 的使用者，可以從以下網址中下載 Icarus 的 MS Windows 版本，其安裝非常容易：

* <http://bleyer.org/icarus/>

### 全加器的範例

傳統的數位邏輯課程當中，我們通常會用「邏輯閘」的組合方式，來設計出所要的電路，以下我們就用「全加器」當範例，
說明如何用「閘級」的語法，在 Verilog 當中設計數位電路。

全加器總共有 3 個輸入 (a, b, c_in)，兩個輸出值 (sum, c_out)，其真值表如下所示：

a   b   c_in    c_out    sum
--- --- -----   ------  -------
0   0   0       0       0
0   0   1       0       1
0   1   0       0       1
0   1   1       1       0
1   0   0       0       1
1   0   1       1       0
1   1   0       1       0
1   1   1       1       1

根據這個真值表，我們可以用卡諾圖得到化簡後的電路 (但必須注意的是，卡諾圖化簡出來的電路只有 AND, OR, NOT，沒有 XOR)，
然後根據化簡後的算式繪製電路圖。(在此範例中，c_out 可以採用卡諾圖化簡出來，但 sum 使用的並非化簡的結果，而是以經驗
得到的 XOR 組合式)

當您完成邏輯運算式設計之後，就可以用 TinyCAD 這個軟體，繪製出全加器的電路如下圖所示：

![用 TinyCAD 繪製的全加器電路圖](../img/FullAdder.jpg)

接著我們可以按照以上的線路，根據 Verilog 的語法，設計出對應元件與測試程式如下所示：

程式：fulladder.v

```verilog
// 以下為全加器模組的定義
module fulladder (input a, b, c_in, output sum, c_out);
wire s1, c1, c2;

xor g1(s1, a, b);
xor g2(sum, s1, c_in);
and g3(c1, a,b);
and g4(c2, s1, c_in) ;
or g5(c_out, c2, c1) ;

endmodule

// 以下為測試程式
module main;
reg a, b, c_in;
wire sum, c_out;

fulladder fa1(a, b, c_in, sum, c_out);

initial begin
  a = 0;  b = 0;  c_in = 0;
  $monitor("%04dns monitor: a=%d b=%d c_in=%d c_out=%d sum=%d", $stime, a, b, c_in, c_out, sum);
  #1000 $finish;
end

always #50 c_in = c_in+1;

always #100 b = b+1;

always #200 a = a+1;

endmodule

```

然後我們就可以利用 Icarus 進行編譯與測試，看看 fulladder.v 的模擬執行結果是否正確。

執行結果：

```
D:\Dropbox\Public\pmag\201306\code>vvp fulladder
0000ns monitor: a=0 b=0 c_in=0 c_out=0 sum=0
0050ns monitor: a=0 b=0 c_in=1 c_out=0 sum=1
0100ns monitor: a=0 b=1 c_in=0 c_out=0 sum=1
0150ns monitor: a=0 b=1 c_in=1 c_out=1 sum=0
0200ns monitor: a=1 b=0 c_in=0 c_out=0 sum=1
0250ns monitor: a=1 b=0 c_in=1 c_out=1 sum=0
0300ns monitor: a=1 b=1 c_in=0 c_out=1 sum=0
0350ns monitor: a=1 b=1 c_in=1 c_out=1 sum=1
0400ns monitor: a=0 b=0 c_in=0 c_out=0 sum=0
0450ns monitor: a=0 b=0 c_in=1 c_out=0 sum=1
0500ns monitor: a=0 b=1 c_in=0 c_out=0 sum=1
0550ns monitor: a=0 b=1 c_in=1 c_out=1 sum=0
0600ns monitor: a=1 b=0 c_in=0 c_out=0 sum=1
0650ns monitor: a=1 b=0 c_in=1 c_out=1 sum=0
0700ns monitor: a=1 b=1 c_in=0 c_out=1 sum=0
0750ns monitor: a=1 b=1 c_in=1 c_out=1 sum=1
0800ns monitor: a=0 b=0 c_in=0 c_out=0 sum=0
0850ns monitor: a=0 b=0 c_in=1 c_out=0 sum=1
0900ns monitor: a=0 b=1 c_in=0 c_out=0 sum=1
0950ns monitor: a=0 b=1 c_in=1 c_out=1 sum=0
1000ns monitor: a=1 b=0 c_in=0 c_out=0 sum=1
```

### 結語

仔細觀察上述輸出結果，您會發現這個結果與真值表的內容完全一致，因此驗證了該設計的正確性！

透過這種方式，您就可以用 Verilog 設計電路的程式，然後用 Icarus 編譯並驗證電路是否正確。

在下期當中，我們將逐步開始深入介紹 Verilog 程式的語法，看看「硬體設計」與「軟體設計」語言有何不同之處，我們下期見！


### 參考文獻
* [陳鍾誠的網站：Icarus Verilog 編譯工具鏈](http://ccckmit.wikidot.com/ve:icarus)
* [陳鍾誠的網站：全加器](http://ccckmit.wikidot.com/ve:fulladder)
