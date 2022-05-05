FROM nginx:mainline-alpine
RUN chgrp -R 0 /usr/share/nginx/html && chmod -R g=u /usr/share/nginx/html
COPY src/html /usr/share/nginx/html

# Not really any point in exposing a port in the Dockerfile. Operator's chosen port will override it.
# EXPOSE 80/tcp

# This is the default command that runs. Don't need to specify it.
# CMD ["nginx", "-g", "daemon off;"]
