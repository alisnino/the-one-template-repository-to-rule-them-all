
WORKDIR /home/$username/app/
COPY ./app/package.json .
RUN npm install yarn
