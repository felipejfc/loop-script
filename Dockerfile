FROM alpine
RUN apk update && \
   apk add bash util-linux
ADD loop-script.sh /
CMD /loop-script.sh
