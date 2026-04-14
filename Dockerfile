FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
COPY flyer.pdf /usr/share/nginx/html/flyer.pdf
COPY machine-front.png /usr/share/nginx/html/machine-front.png
COPY machine-angle.png /usr/share/nginx/html/machine-angle.png
COPY nginx.conf /etc/nginx/conf.d/default.conf.template
RUN rm /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD sh -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
