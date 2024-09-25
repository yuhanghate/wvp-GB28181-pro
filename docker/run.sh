#!/usr/bin/env bash

dir_name="wvp-GB28181-pro"
rm -rf wvp-pro*.jar
if [ -d "$dir_name" ]; then
    echo "目录已存在，执行 git pull 更新代码。"
    cd "$dir_name"
    git pull
    rm -rf target
else
    echo "目录不存在，执行 git clone。"
    git clone git@github.com:yuhanghate/wvp-GB28181-pro.git
    cd "$dir_name"
fi

# 编译jar包
mvn clean package
rm -rf wvp-pro*.jar
cd target && cp wvp-pro*.jar ../../ && cd ../../

# 定义应用组名
group_name='sip'
# 定义应用名称
app_name='sip'
# 定义应用版本
app_version='1.0'
echo '----复制 jar包----'
docker stop ${app_name}
echo '----停止容器----'
docker rm ${app_name}
echo '----删除容器----'
docker rmi ${group_name}/${app_name}:${app_version}
echo '----删除镜像----'
# 打包编译docker镜像
docker build -t ${group_name}/${app_name}:${app_version} .
echo '----build 镜像----'

# 线上
docker run --restart always --name ${app_name} \
  -e TZ="Asia/Shanghai" \
  -v /etc/localtime:/etc/localtime \
  -p 18080:8080 \
  -p 5060:5060 \
  -p 5060:5060/udp \
  -d ${group_name}/${app_name}:${app_version}

echo '----容器开启成功----'
