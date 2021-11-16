FROM node:latest
# ### ^^ installs node.js

# ### install python
RUN apt-get update && \
    apt-get install -y python

# ### install swipl (swi-prolog)
## for apt to be noninteractive
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

## preseed tzdata, update package index, upgrade packages and install needed software
RUN echo "tzdata tzdata/Areas select America" > /tmp/preseed.txt ; \
    echo "tzdata tzdata/Zones/America select Toronto" >> /tmp/preseed.txt; \
    debconf-set-selections /tmp/preseed.txt && \
    apt-get update && \
    apt-get install -y tzdata
    
RUN   apt-get update && \
      apt-get install -y swi-prolog

RUN   export PATH=/root/.local/bin:/usr/local/bin:/root/.local/bin:$PATH


# ### program
COPY tasks.bash .
COPY task.bash .
COPY atask.bash .
COPY hello.js .
COPY hello.py .
COPY hello.pl .
COPY hello1.pl .

RUN chmod a+x ./*.bash
ENTRYPOINT ["./tasks.bash"]
