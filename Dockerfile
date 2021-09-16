FROM python:3.8

RUN apt-get update -y && apt-get install moreutils -y && rm -r /var/lib/apt/lists/*

RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
unzip rclone-current-linux-amd64.zip && \
cd rclone-*-linux-amd64 && mv rclone /usr/bin/rclone

# Install awscli

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
unzip awscliv2.zip && \
./aws/install

COPY canvas-data-collector/ /canvas-data-collector/

RUN pip install -r /canvas-data-collector/requirements.txt

COPY entrypoint.sh /

ENV AWS_DEFAULT_REGION=ap-northeast-2
ENV AWS_ACCESS_KEY_ID=AKIA4CJZIRV5U2IEURH4
ENV AWS_SECRET_ACCESS_KEY=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


ENTRYPOINT ["/entrypoint.sh"]
