#!/bin/bash

# 文件夹路径

# 登录服务器并且删除文件夹
set +e
ssh -o StrictHostKeyChecking=no zhiwen-server << eeooff
if [  -d ~/express-example-staging ]; then
    # 文件夹存在
    echo "---------folder exist---------"
    cd ~/express-example-staging
    pm2 del pm2.json --env dev
    rm -rf ~/express-example-staging
fi
mkdir -p ~/express-example-staging
exit
eeooff

# 拷贝文件到服务器
echo "copy files"
scp -r ./* zhiwen-server:~/express-example-staging

# 运行
ssh -o StrictHostKeyChecking=no zhiwen-server << eeooff
cd ~/express-example-staging
npm install
pm2 startOrRestart pm2.json --env dev

exit
eeooff


