###########
# builder #
FROM node:16-alpine as build
RUN apk --no-cache add git python3 make g++
WORKDIR /app
RUN git clone https://git.sr.ht/~cadence/bibliogram .
RUN npm install --no-optional

#######
# app #
FROM node:16-alpine as app
WORKDIR /app
COPY --from=build /app /app
RUN apk add --no-cache git graphicsmagick
EXPOSE 10407
CMD ["npm", "start"]
