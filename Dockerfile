FROM nginx:mainline-alpine
COPY src/html /usr/share/nginx/html

USER 1001
RUN chgrp -R 0 /var/cache/nginx && chown -R 1001:0 /var/cache/nginx

# Not really any point in exposing a port in the Dockerfile. Operator's chosen port will override it.
# EXPOSE 80/tcp

# This is the default command that runs. Don't need to specify it.
# CMD ["nginx", "-g", "daemon off;"]
