FROM ubuntu:24.04

WORKDIR /app

COPY . .

RUN SCRIPT="$(find . -type f -name 'system_info.sh' | head -n 1)" \
    && test -n "$SCRIPT" \
    && chmod +x "$SCRIPT"

CMD ["sh", "-c", "SCRIPT=$(find . -type f -name 'system_info.sh' | head -n 1); exec \"$SCRIPT\""]FROM 
