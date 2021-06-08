#!/bin/bash
# 手动发布静态文件到 GitHub

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

# 定义 github 仓库地址，和存放静态页面的分支，使用前请修改这两个变量的值
my_repo_1='git@gitee.com:pudongping/notes.git'
# 如果你有多个远程仓库，请自行添加下面这一行
my_repo_2='git@github.com:pudongping/notes.git'
my_branch='gh-pages'

# 当前发布时间
current_time=`date +"%Y-%m-%d %H:%M:%S"`
# 发布代码目录
temp_deploy='.deploy_git'
# gitbook脚本目录
gitbook_path=$(which gitbook)

# 定义该变量为只读
readonly my_repo
readonly my_branch

# 判断是否存在 gitbook 命令
if [ ! -f $gitbook_path ];then
    orangered 'Sorry ! The gitbook path is not found ! Please check if the gitbook has been installed .'
    exit 0
fi

# 开始执行发布脚本
blue 'Deploy starting ......'

# 生成静态文件
orangered 'Generate static files'
gitbook build .

# 如果不存在发布目录
if [ ! -d ./$temp_deploy ]
then
  # 第一次执行部署命令时
  cp -r ./_book ./$temp_deploy && cd ./$temp_deploy
  # 初始化一个仓库，仅仅是做了一个初始化的操作，项目里的文件还没有被跟踪
  git init
  orangered 'execute command  ===> git init'
  # 添加远程仓库地址
  git remote add origin $my_repo_1
  # 如果你有多个远程仓库，请自行添加下面这一行
  git remote set-url --add origin $my_repo_2
  git add -A
  git commit -m "First commit"
else
  # 多次执行部署命令时
  cd ./$temp_deploy
  rm -rf *
  cp -r ../_book/* ./
  # 添加所有的修改到 git 的缓存区
  git add -A
  git commit -m "Site updated: ${current_time}"
fi

# 新建分支和切换到新分支。这里一定要切换到发布代码的分支上，不然可能会出现意想不到的结果！
git checkout -b $my_branch

# 发布到远程仓库 gh-pages 分支，因为这里都是使用 gitbook 编译后的文件，因此可以直接通过 -f 参数覆盖掉远程分支，文件要是丢失了的话，多编译几次，再多强制推送
orangered "execute command  ===> git push -f -u origin ${my_branch}"
git push -f -u origin $my_branch

green "Congratulations, deploy successful! The end !"

exit 0
