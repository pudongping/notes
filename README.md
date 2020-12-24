<p align="center">
    <h1 align="center"><a href="https://drling.xin">Alex's notes</a></h1>
    <p align="center">三观比五官正，思想比套路深的 live and learn's coder。😘</p>
</p>
<p align="center">
    <a href="https://github.com/pudongping/pudongping.github.io" target="_blank">
        <img alt="GitHub Workflow Status" src="https://img.shields.io/badge/notes-gitbook--notes-orange">
    </a>
    <a href="https://github.com/pudongping/pudongping.github.io" target="_blank">
        <img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/pudongping/pudongping.github.io">
    </a>
    <a href="https://github.com/pudongping/pudongping.github.io" target="_blank">
        <img alt="Issues" src="https://img.shields.io/github/issues/pudongping/pudongping.github.io" />
    </a>
    <a href="https://github.com/pudongping/pudongping.github.io/pulls" target="_blank">
        <img alt="GitHub pull requests" src="https://img.shields.io/github/issues-pr/pudongping/pudongping.github.io" />
    </a>
    <a href="https://github.com/pudongping/pudongping.github.io" target="_blank">
        <img alt="GitHub" src="https://img.shields.io/github/license/pudongping/pudongping.github.io">
    </a>
<br/>
<br/>
    <a href="https://github.com/pudongping/pudongping.github.io" target="_blank">
        <img alt="GitHub followers" src="https://img.shields.io/github/followers/pudongping?style=social">
    </a>
    <a href="https://github.com/pudongping/pudongping.github.io" target="_blank">
        <img alt="GitHub forks" src="https://img.shields.io/github/forks/pudongping/pudongping.github.io?style=social">
    </a>
    <a href="https://github.com/pudongping/pudongping.github.io" target="_blank">
        <img alt="GitHub stars" src="https://img.shields.io/github/stars/pudongping/pudongping.github.io?style=social">
    </a>
    <a href="https://github.com/pudongping/pudongping.github.io" target="_blank">
        <img alt="GitHub watchers" src="https://img.shields.io/github/watchers/pudongping/pudongping.github.io?style=social">
    </a>
</p>
<p align="center">喜欢这个笔记？可以考虑通过 <a href="./resources/images/wechat.png" target="_blank">赞赏</a> 来帮助它完善！</p>


# 简介

本仓库主要用来记录本人在编程路上的笔记，笔记内容有原创，也有借鉴，若不慎侵权，请联系我，我会及时删除。  

## 在线访问我的笔记
- [![SugarYesP 削个椰子皮_给个梨的笔记](https://img.shields.io/badge/SugarYesP_削个椰子皮_给个梨的笔记-https://drling.xin-brightgreen.svg)](https://drling.xin)
- [![Gitee](https://img.shields.io/badge/GiteePages-https://pudongping.gitee.io-brightgreen.svg)](https://pudongping.gitee.io)
- [![Github](https://img.shields.io/badge/GithubPages-https://pudongping.github.io-brightgreen.svg)](https://pudongping.github.io)

### 个人微信号

> 名称：`削个椰子皮-给个梨`  
微信号：`ying5198023`  （请注明来意，谢谢！）

### 你也想要一份类似的笔记？

本笔记主要采用 `gitbook` 搭建，使用 `gitbook` 写书籍很 nice，但是如果再搭配合适的插件，那简直就是如虎添翼之举，当然你也可以直接参照我的 `gitbook` 配置文件 `book.json`，喜欢就拿去

### 如何部署？

#### 仓库地址

- [Github](https://github.com/pudongping/pudongping.github.io.git)
- [Gitee](https://gitee.com/pudongping/pudongping.git)

#### 本地部署

- 直接使用 `git` 拉取项目并进入相应的文件目录


```bash
git clone https://gitee.com/pudongping/pudongping.git glory  && cd glory
```


- 安装 `gitbook` 的依赖插件


```bash
# 安装项目所需要的插件
gitbook install

# 如果使用 gitbook install 安装插件太慢了，那么建议直接使用 npm install 安装插件，本项目中所有的插件均已使用 npm 初始化，放心使用
```


- 启动本地服务


```bash
gitbook serve
```

可以打开浏览器访问 `localhost:4000` 或者 `127.0.0.1:4000` 进行访问

> 如果安装过程中，不知道如何使用 `gitbook` 可以参考我写的这篇 `gitbook` 教程 [Gitbook 使用](/doc/frontend-notes/how-to-use-gitbook.md)


#### 线上部署

- 编译项目

```bash
gitbook build ./
```

- 执行以上命令之后会在项目目录生成 `_book` 文件夹，直接将 `_book` 目录下所有的文件复制到线上项目根目录下即可，其中 `_book/index.html` 即为项目的默认入口文件

> 如果你想通过 `GitHub pages` 来部署，可以直接执行项目根目录下的 `deploy.sh` 脚本文件，执行该脚本之前，你需要进入该脚本将 `my_repo` 和 `my_branch` 变量对应的值修改成你自己的仓库信息，然后执行 `bash deploy.sh` 命令，即可看到在远程仓库中多创建了一个 `my_branch` 变量对应的分支

### 关于目录

- _book ： 编译后的静态文件目录
- doc ： 原始 markdown 文件目录
- resources ： 静态资源目录
- .gitignore ： git 忽略文件
- book.json ： gitbook 配置文件
- book.json.example ： gitbook 备份配置文件 （带有部分注释信息）
- deploy.sh ： 发布脚本文件 （使用前需要将远程仓库地址改成自己的）
- INTRODUCTION.md ： 简介文件
- LICENSE ： 开源协议文件
- package-lock.json ： npm 扩展包锁文件
- package.json ： npm 扩展包配置文件
- README.md ： 项目说明文件
- SUMMARY.md ： gitbook 目录文件

### 感谢支持

如果你觉得本教程对你有所帮助,请帮忙给个 `Star`。  
如果你想贡献一份力量,欢迎提交 `Pull Request`。

### 赞赏捐助

<div style="display: flex; align-items: center; justify-content: space-around;">
    <div style="width: 150px; text-align: center;">
        <a href="./resources/images/alipay.png">
            <img src="./resources/images/alipay.png" alt="alipay"/>
        </a>
        <p>支付宝<p>
    </div>
    <div style="width: 150px; text-align: center;">
        <a href="./resources/images/wechat.png">
            <img src="./resources/images/wechat.png" alt="wechat"/>
        </a>
        <p>微信<p>
    </div>
</div>


> 😘 若有共鸣，留言足矣，若有赞赏，何以复加？ 🤞