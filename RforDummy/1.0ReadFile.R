---
  title: "R Read Table"
author: "NingChen"
output:
  revealjs::revealjs_presentation

---
  
  <style>
  .reveal pre code {
    background:white;
    color: black;
  }

.reveal pre code span {
  color: black;
  font-weight: normal;
}

div.hidecode + pre + pre {display: none}
</style>
  <script>
  doclick=function(e){
    var elem = e.nextSibling.nextSibling.nextSibling.nextSibling;
    if(elem.style.display=="none"){
      elem.style.display="block";
    }else{
      elem.style.display="none";
    }
  }
</script>
  
  
  
  # 讀取資料
  
  * read.table

read.table(x,header=TRUE/FALSE)


## 調整檔案位置

setwd
```{r setwd}
setwd("~/Downloads/UTF/01")
```



## 讀檔案

```{r readtxt}
dta <- read.table(file = 'Quality_of_Life.txt',header = TRUE)
```


## 了解資料集

```{r}
#dta 的類型是資料框架（data frame）
class(dta)

#看看dta維度
dim(dta)

#利用names看看變項名稱
names(dta)

#看前六筆
head(dta)
```

## 解釋變數

視力:視力困難
聽力:聽力困難
移動:移動困難
溝通:溝通困難

Note:將生活品質問卷的相關四項加總成四個分數

# 選取資料集

```{r}
#看看第一列第一欄對應資料，這是類別資料
dta[1, 1]

#看看第九列，這是資料框架
dta[9, ]
str(dta[9, ])
#看看第一欄，這「不是」資料框架，是類別
dta[,1]
str(dta[,1])
```


```{R}
#一維方式資料輸出,類別變項
str(dta[,'教育'])
str(dta$教育)
str(dta[['教育']])
#按照二維方式輸出,資料框架
str(dta['教育'])

```

## 繪圖顯示（示範資料重新結構）

```{r reshape and plot}
#將五個變數以兩個類別變項分組,取平均
hlt <- aggregate(cbind(視力, 聽力, 移動, 溝通, 功能) ~ 性別 + 年齡,
                 + data = dta, mean)
#把 hlth 的前兩欄命名
names(hlt)[1:2] <- c('性別', '年齡')
hlt
#不同性別與年齡的健康功能圖
with(hlt, dotchart(t(功能), group = 性別, labels = 年齡, xlab = '功能'))
```

# Homework

有上過R Basic datastrucure 從資料源挑資料集做分析
可以從 1.MASS
2.The Analystics Edge

沒上過 Basic datastrucure 先練習
[Introduction to R](https://www.datacamp.com/courses/free-introduction-to-r) (around 4 hours)



# 讀取資料

* read.table

read.table(x,header=TRUE/FALSE)


## 調整檔案位置

setwd
```{r setwd}
setwd("~/Downloads/UTF/01")
```



## 讀檔案

```{r readtxt}
dta <- read.table(file = 'Quality_of_Life.txt',header = TRUE)
```


## 了解資料集

```{r}
#dta 的類型是資料框架（data frame）
class(dta)

#看看dta維度
dim(dta)

#利用names看看變項名稱
names(dta)

#看前六筆
head(dta)
```

## 解釋變數

視力:視力困難
聽力:聽力困難
移動:移動困難
溝通:溝通困難

Note:將生活品質問卷的相關四項加總成四個分數

# 選取資料集

```{r}
#看看第一列第一欄對應資料，這是類別資料
dta[1, 1]

#看看第九列，這是資料框架
dta[9, ]
str(dta[9, ])
#看看第一欄，這「不是」資料框架，是類別
dta[,1]
str(dta[,1])
```


```{R}
#一維方式資料輸出,類別變項
str(dta[,'教育'])
str(dta$教育)
str(dta[['教育']])
#按照二維方式輸出,資料框架
str(dta['教育'])

```

## 繪圖顯示（示範資料重新結構）

```{r reshape and plot}
#將五個變數以兩個類別變項分組,取平均
hlt <- aggregate(cbind(視力, 聽力, 移動, 溝通, 功能) ~ 性別 + 年齡,
                 + data = dta, mean)
#把 hlth 的前兩欄命名
names(hlt)[1:2] <- c('性別', '年齡')
hlt
#不同性別與年齡的健康功能圖
with(hlt, dotchart(t(功能), group = 性別, labels = 年齡, xlab = '功能'))
```

# Homework

有上過R Basic datastrucure 從資料源挑資料集做分析
可以從 1.MASS
2.The Analystics Edge

沒上過 Basic datastrucure 先練習
[Introduction to R](https://www.datacamp.com/courses/free-introduction-to-r) (around 4 hours)

