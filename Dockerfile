FROM amazonlinux AS builder

RUN yum install unzip -y

RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
unzip rclone-current-linux-amd64.zip && \
cd rclone-*-linux-amd64 && mv rclone /usr/bin/rclone

# Install awscli

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
unzip awscliv2.zip && \
./aws/install

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
