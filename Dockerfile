FROM python:alpine3.18

WORKDIR /bing

# 安装依赖
COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# 拷贝应用代码
COPY . .

# 设置环境变量
ENV PORT=80

# 启动应用
CMD ["python3", "BingServer.py"]

# 基于官方的 Nginx 镜像构建
FROM nginx:alpine

# 将当前目录下的 static 目录拷贝到容器中的 /usr/share/nginx/html 目录下
COPY ./static /usr/share/nginx/html

# 暴露 80 端口
EXPOSE 80
