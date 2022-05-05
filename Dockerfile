FROM nginx:mainline-alpine
COPY src/html /usr/share/nginx/html
COPY src/config /etc/nginx
RUN chgrp -R 0 /var/cache/nginx && chown -R 1001:0 /var/cache/nginx && touch /var/run/nginx.pid && chown -R 1001:0 /var/run/nginx.pid && chgrp -R 0 /var/run/nginx.pid
RUN chmod 775 /var/cache/nginx && chmod 775 /var/run/nginx.pid

USER 1001
RUN chgrp -R 0 /var/cache/nginx && chown -R 1001:0 /var/cache/nginx && touch /var/run/nginx.pid && chown -R 1001:0 /var/run/nginx.pid && chgrp -R 0 /var/run/nginx.pid
RUN chmod 775 /var/cache/nginx && chmod 775 /var/run/nginx.pid

# Not really any point in exposing a port in the Dockerfile. Operator's chosen port will override it.
EXPOSE 8081/tcp

# This is the default command that runs. Don't need to specify it.
CMD ["nginx", "-g", "daemon off;"]
