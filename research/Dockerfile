# 任意のイメージを取得
FROM richxsl/rhel7:min

WORKDIR /app

COPY app /app

RUN chmod 755 /app/readFile.sh

ENTRYPOINT [ "/app/readFile.sh", "/app/LF_file_EOF_none.txt" ]
