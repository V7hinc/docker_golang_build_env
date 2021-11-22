# docker_golang_build_env

> centos7系统的golang编译环境。主要是为了快速搭建golang编译环境和快速清除环境。因为golang编译后就是个二进制文件，golang环境就没有用了
## 使用命令
```
docker build -t go-build-env .
docker run -it go-build-env
```

然后就可以拷贝go项目到/app/gopath/src下进行编译了。