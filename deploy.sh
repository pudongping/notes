#!/bin/bash
# 手动发布静态文件到 GitHub

echo 'Starting ......'

# 生成静态文件
echo 'execute command  ===> gitbook build .'
gitbook build .

# 复制已经打包好的静态文件夹 _book 到临时文件夹 temp_deploy 且进入 temp_deploy 文件夹内
echo 'execute command  ===> cp ./_book temp_deploy && cd ./temp_deploy'
cp ./_book temp_deploy && cd ./temp_deploy

# 初始化一个仓库，仅仅是做了一个初始化的操作，项目里的文件还没有被跟踪
echo 'execute command  ===> git init'
git init

# 添加远程仓库地址
echo 'execute command  ===> git remote add origin git@github.com:pudongping/glory.git'
git remote add origin git@github.com:pudongping/glory.git

# 添加所有的修改到 git 的缓存区
echo 'execute command  ===> git add -A'
git add -A

# 将缓存区的内容提交到本地仓库中
echo "execute command  ===> git commit -m 'deploy'"
git commit -m 'deploy'

# 发布到远程仓库 static-pages 分支
echo 'execute command  ===> git push -f -u origin static-pages'
#git push -f -u origin static-pages 

# 返回上层目录，并删除临时目录
echo 'execute command  ===> cd ../ && rm -rf ./temp_deploy'
#cd ../ && rm -rf ./temp_deploy

echo "Congratulations ! The end !"