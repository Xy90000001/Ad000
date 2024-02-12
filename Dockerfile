FROM ubuntu:latest
RUN wget "https://cdn.pawns.app/download/cli/latest/linux_x86_64/pawns-cli"
RUN ls

CMD ["./pawns-cli -email=Xy90000001@gmail.com -password=Xy90000001@gmail.com -device-name=raspberrypiq -accept-tos"]
