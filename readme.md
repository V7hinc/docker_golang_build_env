# docker_golang_build_env

> centos7系统的golang编译环境。主要是为了快速搭建golang编译环境和快速清除环境。因为golang编译后就是个二进制文件，golang环境就没有用了
> 带自动编译脚本
## 使用命令
镜像
```
# 编译镜像
docker build -t ghcr.io/v7hinc/go-build-env:centos7-go1.17.3 .
# 或者拉取已构建的镜像
docker pull ghcr.io/v7hinc/go-build-env:centos7-go1.17.3
```
编译go项目
```
# 采用自动编译（项目名称需更改称自己的项目英文名称）
docker run --rm -e 'projectName=项目名称' -v `pwd`:/app/gopath/src/项目名称 -it ghcr.io/v7hinc/go-build-env:centos7-go1.17.3
# 不采用自动编译，想进入容器后手动编译
docker run -it ghcr.io/v7hinc/go-build-env:centos7-go1.17.3 bash
```

然后就可以拷贝go项目到/app/gopath/src下进行编译了。