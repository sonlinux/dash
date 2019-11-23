FROM node:10 as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
# RUN npm i
COPY . .
# ARG APP_MOUNT_URI
# ARG API_URI
# ARG STATIC_URL
ENV API_URI ${API_URI:-http://localhost:8000/graphql/}
# ENV APP_MOUNT_URI ${APP_MOUNT_URI:-/dashboard/}
# ENV STATIC_URL ${STATIC_URL:-/dashboard/}
# RUN STATIC_URL=${STATIC_URL} API_URI=${API_URI} APP_MOUNT_URI=${APP_MOUNT_URI} npm run build
# RUN STATIC_URL=${STATIC_URL} API_URI=${API_URI} npm start

EXPOSE 9000

CMD ["npm", "start"]

# FROM nginx:stable
# WORKDIR /app
# COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
# COPY --from=builder /app/build/ /app/
