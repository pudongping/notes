#!/bin/bash
# 手动发布静态文件到 GitHub

# 定义 github 仓库地址，和存放静态页面的分支，使用前请修改这两个变量的值
my_repo='git@github.com:pudongping/glory.git'
my_branch='static-pages'

# 定义该变量为只读
readonly my_repo
readonly my_branch

# 定义颜色系列函数

# blue to echo 
function blue(){
    echo -e "\033[36m $1 \033[0m" 
}

# green to echo 
function green(){
    echo -e "\033[32m[ $1 ]\033[0m"
}

# Error
function orangered(){
    echo -e "\033[31m\033[01m[ $1 ]\033[0m"
}

# warning
function yellow(){
    echo -e "\033[33m\033[01m[ $1 ]\033[0m"
}

# 开始执行发布脚本

blue 'Starting ......'

# 生成静态文件
orangered 'execute command  ===> gitbook build .'
gitbook build .

# 复制已经打包好的静态文件夹 _book 到临时文件夹 temp_deploy 且进入 temp_deploy 文件夹内
orangered 'execute command  ===> cp -r ./_book ./temp_deploy && cd ./temp_deploy'
cp -r ./_book ./temp_deploy && cd ./temp_deploy

# 初始化一个仓库，仅仅是做了一个初始化的操作，项目里的文件还没有被跟踪
orangered 'execute command  ===> git init'
git init

# 添加远程仓库地址
orangered "execute command  ===> git remote add origin ${my_repo}"
git remote add origin $my_repo

# 添加所有的修改到 git 的缓存区
orangered 'execute command  ===> git add -A'
git add -A

# 将缓存区的内容提交到本地仓库中，并新建分支和切换到新分支
orangered "execute command  ===> git commit -m 'deploy' && git checkout -b ${my_branch}"
git commit -m 'deploy' && git checkout -b $my_branch

# 发布到远程仓库 static-pages 分支
orangered "execute command  ===> git push -f -u origin ${my_branch}"
git push -f -u origin $my_branch

# 返回上层目录，并删除临时目录
orangered 'execute command  ===> cd ../ && rm -rf ./temp_deploy'
cd ../ && rm -rf ./temp_deploy

green "Congratulations ! The end !"