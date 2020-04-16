FROM node:12
MAINTAINER Jason Tranchida <jtranchida@gmail.com>

# Update NPM to the latest available version
RUN npm i npm@latest -g

# Pull all of the dependencies
#ADD package.json package.json
#RUN npm install --production

#ADD . .
RUN npm install -g cncjs@latest --unsafe

EXPOSE 8000
CMD ["bin/cncjs"]