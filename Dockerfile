FROM node:8
WORKDIR /Blockchain
COPY . /Blockchain
RUN npm install truffle
RUN npm install
RUN truffle compile
RUN truffle migrate