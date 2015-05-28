# gulp-html-optimizer

html文件合并，本质是个简单的模板引擎,额外添加的一些功能


Usage
-----

### 模板继承

index.src.html继承root.base.html
```html
<!-- extend "./root.base.html" -->
```


### 复写

root.base.html 

```html
<!-- yield "content" -->
Default root content.
<!-- /yield -->
```

index.src.html

```html
<!-- section "content" -->
<div class="index-base">
<img src="./arrow.png" />
</div>
<!-- /section -->

```


### 内容嵌入

如:引入当前目录下的js

```html
<!-- include "./head-a.js" -->
```

### 内容嵌入-携带变量

head.inc.html

```html
<p>We learn %{{lang}}% at %{{time}}%</p>
```

index.src.html

```html
<!-- include "./head.inc.html" lang="CoffeeScript" time="2015-01-01" -->
```

结果:
```html
<p>We learn CoffeeScript at 2015-01-01</p>
```

## 路径问题

```
<!-- 转换成base64字符串时时可以使用 -->
<img src="../img/google.png" height="216" width="711">

<!-- 若是include 进入，下面路径是相对要include文件的位置 -->
<img src="../img/avatar.jpeg?" height="160" width="160">
```

## 配置

```CoffeeScript
    gulp.src('example/src/**/*.src.html')
        .pipe htmlOptimizer
            generateDataUri: true 
            cssSprite:  
                base: 
                    url: '//webyom.org'
                    dir: 'example/src'
            beautifyTemplate: true
            trace: true
            postcss: (file, type) ->
                res = postcss()
                    .use postcssImport()
                    .use autoprefixer browsers: ['last 2 version']
                    .process file.contents.toString(),
                        from: file.path
                res.css
        .pipe gulp.dest('example/dest')
```

### generateDataUri

是否把<img>标签、css中的图片变成base64字符串

**NOTE**

* Q: 如果部分图片不想被变换怎么设置? 
A: 看源代码知道,如果找不到这个图片文件就，就不用转换成base64字符串，那么我们约定在路径后面加上`?`即可

例如：

```html
 <img src="../img/google.png?">
```

### beautifyTemplate

是否美化模板，

### trace 

是否注入跟踪信息



