FROM ubuntu:24.04

WORKDIR /app

COPY . .

RUN chmod +x $(find . -type f -name "system_info.sh")

CMD ["bash"]
