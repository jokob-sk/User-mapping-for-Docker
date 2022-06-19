FROM debian

ENV USER=newuser USER_ID=1000 USER_GID=1000

RUN apt update \
    && apt install git -y \
    && apt install sudo -y \
    && apt install mc -y \
    && apt install curl -y \
    && apt install nano -y 

# now creating user
RUN groupadd --gid "${USER_GID}" "${USER}" && \
    useradd \
      --uid ${USER_ID} \
      --gid ${USER_GID} \
      --create-home \
      --shell /bin/bash \
      ${USER}

COPY user-mapping.sh /
RUN  chmod u+x user-mapping.sh


ADD start.sh / 
RUN chmod +x start.sh

#USER ${USER}

CMD ["./start.sh"]