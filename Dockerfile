FROM node:13.10.1-alpine3.11 as resource
RUN npm install -g jest && npm install -g aws-sdk@^2.635.0
FROM resource

ENTRYPOINT [ "npm" ]
CMD [ "--version" ]
