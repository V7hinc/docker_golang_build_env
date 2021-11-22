FROM centos:7

ENV VERSION='1.17.3'
ENV GOROOT=/usr/local/go
ENV PATH=$PATH:$GOROOT/bin
ENV GOPATH=/app/gopath

WORKDIR /tmp

# 安装依赖包
RUN set -x;\
yum install -y lrzsz gcc wget;

# 下载安装包
RUN set -x;\
wget https://studygolang.com/dl/golang/go${VERSION}.linux-amd64.tar.gz;

# 部署golang环境
RUN set -x;\
tar xvf go${VERSION}.linux-amd64.tar.gz -C /usr/local/;\
rm -f go${VERSION}.linux-amd64.tar.gz;\
# 创建GOPATH目录
mkdir -pv /app/gopath/src;\
# 添加环境变量
go version;\
# 便于第三方导入的设置
go env -w GO111MODULE=on;\
go env -w GOPROXY=https://goproxy.cn,direct

# 自动编译项目自启动脚本
RUN set -x;\
echo '#!/bin/sh' >> /auto_start.sh;\
echo 'cd $GOPATH/src/$projectName' >> /auto_start.sh;\
echo 'go mod init $projectName' >> /auto_start.sh;\
echo 'go mod tidy' >> /auto_start.sh;\
echo 'go build' >> /auto_start.sh;\
chmod +x /auto_start.sh;

WORKDIR /app/gopath/src

CMD /auto_start.sh