FROM nginx:alpine
RUN apk add --no-cache hugo
COPY . /tmp/hugo
WORKDIR /tmp/hugo
RUN hugo
RUN cp -r /tmp/hugo/public/* /usr/share/nginx/html