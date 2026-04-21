FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
COPY flyer.pdf /usr/share/nginx/html/flyer.pdf
COPY machine-front.webp /usr/share/nginx/html/machine-front.webp
COPY favicon.png /usr/share/nginx/html/favicon.png
COPY favicon.ico /usr/share/nginx/html/favicon.ico
COPY machine-angle.webp /usr/share/nginx/html/machine-angle.webp
COPY case-pet.jpg /usr/share/nginx/html/case-pet.jpg
COPY case-portrait.jpg /usr/share/nginx/html/case-portrait.jpg
COPY tirol-wappen.svg /usr/share/nginx/html/tirol-wappen.svg
COPY nginx.conf /etc/nginx/conf.d/default.conf.template
RUN rm /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD sh -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
