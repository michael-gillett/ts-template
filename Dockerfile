# This is a light-weight, production ready, distroless image
# https://github.com/GoogleContainerTools/distroless

##################################################
#                  Build Phase                   #
##################################################
# Install dependencies and compile typescript
FROM node:10.17.0 as build-env
ADD . /app
WORKDIR /app

RUN yarn install
RUN yarn build

##################################################
#                  Final Phase                   #
##################################################
# Copy files from "Build Phase" and run node
FROM gcr.io/distroless/nodejs as final
WORKDIR /app
COPY --from=build-env /app /app

EXPOSE 8080
CMD ["out/index.js"]
