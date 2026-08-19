ARG PYTHON_VERSION=3.12
FROM python:${PYTHON_VERSION}-slim

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        iputils-ping \
        curl \
        gosu \
    && rm -rf /var/lib/apt/lists/*; \
    # 建软链让现有脚本里的 su-exec 命令继续工作，无需改任何脚本
    ln -s /usr/sbin/gosu /usr/local/bin/su-exec

ENV PUID=0 PGID=0 UMASK=022 TZ=Asia/Shanghai
