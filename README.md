# 수선화안녕.com

* Rails form helper CRUD

* Bootstrap + fontawesome


| Model(모델 이름) |  Column(속성)  |                 |
|:----------------:|:--------------:|:---------------:|
|       Trade      |  title:string  |   content:text  |
|                  | kakaoid:string | user:belongs_to |
|                  |   variety:string  |   image:string  |

물물교환(`Trade`)에서 옷(`cloth`), 책(`book`), 기타(`rest`)를 교환하며  
이는 `variety`에서 결정한다.

```bash
$ rails g model Trade title:string content:text kakaoid:string user:belongs_to variety:string image:string
```

```bash
$ rails g controller Trades index show new edit 
```