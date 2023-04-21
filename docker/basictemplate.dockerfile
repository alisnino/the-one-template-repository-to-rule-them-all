FROM some:image

# EITHER USE THIS...
ARG username
ARG groupname
ARG uid=1000
ARG gid=1000
ARG password=1234

RUN groupadd -g ${gid} ${groupname} && \
  useradd -m -s /bin/bash -u ${uid} -g ${gid} -G sudo ${username} && \
  echo ${username}:${password} | chpasswd && \
  echo "${username}   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# ...OR THIS, if the image you're using already has a user registered to gid 1000 and you need a miracle. e.g. Node.js images
# ARG username
# RUN usermod -l ${username} node

# ------------------------------------------------------------------
# Then copy the content from the other template files from here....



# ... to here
# ------------------------------------------------------------------

USER $username

