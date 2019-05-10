#!/bin/bash

# 文件夹路径

# 登录服务器并且删除文件夹
set +e
ssh -o StrictHostKeyChecking=no ec2-user@52.82.65.180 << eeooff
if [[  -d ~/express-example-staging ]]; then
    # 文件夹存在
    cd ~/express-example-staging
    pm2 stop pm2.json --env dev
    rm -rf ~/express-example-staging
fi
mkdir -p ~/express-example-staging
exit
eeooff

# 拷贝文件到服务器
scp -r ./* ec2-user@52.82.65.180:~/express-example-staging

# 运行
ssh -o StrictHostKeyChecking=no ec2-user@52.82.65.180 '"$path" $path'<< eeooff
cd ~/express-example-staging
npm install
pm2 startOrRestart pm2.json --env dev

exit
eeooff


