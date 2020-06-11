FROM node:13.10.1-alpine3.11 as resource
RUN apk add curl \
    python3 \
    jq \
    && ln -s /usr/bin/python3 /bin/python \
    && curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" \
    && unzip awscli-bundle.zip \
    && ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws \
    && npm install -g jest \
    && npm install -g aws-sdk@^2.635.0
FROM resource

ENTRYPOINT [ "aws" ]
CMD [ "--version" ]
