FROM ubuntu:24.04

WORKDIR /app

COPY . .

RUN chmod -R +x .

CMD ["bash","-c","SCRIPT=$(find . -type f -name 'system_info.sh' | head -1); $SCRIPT"]
