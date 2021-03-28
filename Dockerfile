FROM ubuntu:18.04

ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update -y 
RUN apt-get install wget -y 
RUN apt-get install xz-utils
RUN wget https://developer.salesforce.com/media/salesforce-cli/sfdx-cli/channels/stable/sfdx-cli-linux-x64.tar.xz -O /opt/sfdx-cli-linux-x64.tar.xz
RUN useradd -d /opt/sfdx salesforce
RUN mkdir -p /opt/sfdx/sfdx
RUN tar xJf /opt/sfdx-cli-linux-x64.tar.xz -C /opt/sfdx/sfdx --strip-components 1
RUN chmod +x /opt/sfdx/sfdx/* 
RUN /opt/sfdx/sfdx/install


