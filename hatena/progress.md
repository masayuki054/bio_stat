
# Table of Contents

1.  [1st 10/07](#org8bb33ea)
    1.  [講義について](#orgfc0bdbf)
    2.  [スライドとデータの準備](#orgdbc4972)
    3.  [前期の確率統計の内容確認](#org1658e6c)
    4.  [R のインストール](#orga3a7999)
2.  [2nd 10/14](#org2f1a1a2)
    1.  [講義について](#orgc1f87a5)
    2.  [スライドとデータの準備](#orgdea00d5)
    3.  [R のインストール](#org30a6d15)
    4.  [Rcmdr か RStudio を使いましょう](#orgf0faac0)
    5.  [Rの初歩](#org0042ef3)
    6.  [R 入門](#orgd1f0770)
    7.  [Rによる統計入門](#orgb5725fa)
        1.  [入門統計学の1章](#orge2c8659)
        2.  [Rの演習](#orgf03ea25)

[top](https://masayuki054.hatenablog.com/entry/2021/03/11/103431) / [R ](https://masayuki054.hatenablog.com/entry/2021/10/06/101325?_ga=2.170599136.1369059129.1633482592-251679600.1592307203)/ [進行](https://masayuki054.hatenablog.com/entry/2021/10/06/103338?_ga=2.200886382.1369059129.1633482592-251679600.1592307203)


<a id="org8bb33ea"></a>

# 1st 10/07


<a id="orgfc0bdbf"></a>

## 講義について

-   シラバス
    -   引き継いだだけの状態，要相談

-   講師の自己紹介
    -   生物，生命に関し，まったくの素人
    
    -   数学としての確率・統計を教えている
    
    -   お昼休みサッカー
        -   12:30 ~ グラウンド， 2~10名でのミニゲーム，素人多数，先生，職
            員，学生

-   講義内容

-   講義方法
-   講義に関する相談
    -   統計に関する既習のことの確認
    -   パソコンの知識
    -   確率統計に関する確認事項
    -   Rの習得法


<a id="orgdbc4972"></a>

## スライドとデータの準備

-   ダウンロード
-   解凍
-   確認
    -   office 有無
    -   ファイル，フォルダ操作の慣れ


<a id="org1658e6c"></a>

## 前期の確率統計の内容確認

-   確率
    -   事前確率，事後確率，ベイズの定理
-   記述統計
    -   平均，分散，共分散，相関
-   確率分布
    -   確率変数
    -   確率密度関数
    -   期待値
-   ベルヌーイ試行，二項分布，多項分布
-   一様分布，正規分布，2次元正規分布
-   カイ二乗分布，t-分布，F-分布
-   母集団と標本
    -   大数の法則，中心極限定理
    -   標本平均が従がう分布の平均と分散
-   推定
    -   最尤推定
    -   母平均値の区間推定
    -   母分散の区間推定

-   仮説検定

復習しながら学んでいきましょう。


<a id="orga3a7999"></a>

## R のインストール

スライド 00 (解凍したスライドの00章)

-   R とは
-   R のインストール
    -   ダウンロード [CRAN国内ミラーの使い方 - RjpWiki](http://www.okadajp.org/RWiki/?CRAN%E5%9B%BD%E5%86%85%E3%83%9F%E3%83%A9%E3%83%BC%E3%81%AE%E4%BD%BF%E3%81%84%E6%96%B9)
    -   インストーラの実行
    -   確認

-   Rコマンダーのインストール
    -   R の起動
    -   R のパッケージインストール
        
            install.packages("Rcmdr")
    -   Rcmdr の起動       
        
            library(Rcmdr)


<a id="org2f1a1a2"></a>

# 2nd 10/14


<a id="orgc1f87a5"></a>

## 講義について

-   お昼休みサッカー (再度)
    -   12:30 ~ グラウンド， 2~10名でのミニゲーム，素人多数，先生，職
        員，学生


<a id="orgdea00d5"></a>

## Done スライドとデータの準備

-   確認 全員 office 有り
-   ファイル，フォルダ操作の慣れ
    
        c:/Users/名前/Onedrive/Documents/R (/は円記号かもしれない)


<a id="org30a6d15"></a>

## Done R のインストール


<a id="orgf0faac0"></a>

## Rcmdr か RStudio を使いましょう

-   Rcmdr の起動       
    
        library(Rcmdr)

-   Rcmdr を自動的に起動する方法
    -   [Rコマンダーの簡単な使い方](http://plaza.umin.ac.jp/~takeshou/R/Rcmdrfirst.html)


<a id="org0042ef3"></a>

## [Rの初歩](https://oku.edu.mie-u.ac.jp/~okumura/stat/first.html)

-   RStudioの概要
-   help
-   終了
-   ワーキング・ディレクトリ(フォルダ)， .Rhistory, .RData, ~/.Rprofile


<a id="orgd1f0770"></a>

## R 入門

-   [初心者用 - R<sub>Stats2.pdf</sub>](http://chianti.ucsd.edu/~rsaito/ENTRY1/WEB_RS3/PDF/JPN/Texts/R_Stats2.pdf)
    
    これを何回かかけてやりましょう
    
    -   起動と終了
    -   変数への代入
    -   簡単な演算
    -   簡単なベクトル演算
    -   簡単な行列の作成と演算
    -   簡単なリストの作成


<a id="orgb5725fa"></a>

## Rによる統計入門


<a id="orge2c8659"></a>

### 入門統計学の1章

-   Excel -> R で書き直し
-   スライドまたは PDF を手元に準備


<a id="orgf03ea25"></a>

### Rの演習

-   [Rで統計学を学ぶ(1)](http://whitewell.sakura.ne.jp/R/Rstatistics-01.html)
-   [Rで統計学を学ぶ(2)](http://whitewell.sakura.ne.jp/R/Rstatistics-02.html)

今日の演習内容をファイルに保存しましょう。

-   自分のRの演習フォルダに
-   日付と項目がわかるように。

-   参考サイト
    -   [Webpage for Probability Theory and Statistics (B)](http://whitewell.sakura.ne.jp/R/)
    -   <http://wiki.cis.iwate-u.ac.jp/~suzuki/RforS/>

