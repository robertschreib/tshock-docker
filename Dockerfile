FROM mono:latest

EXPOSE 7777

RUN apt-get update && apt-get install unzip -y
RUN mkdir tshock
WORKDIR /tshock
RUN ls &&  curl https://github.com/Pryaxis/TShock/releases/download/v4.4.0-pre6/TShock_4.4.0_Pre6_Terraria1.4.0.3.zip -L -o tshock.zip && unzip tshock.zip && rm tshock.zip
COPY serverconfig.txt /tshock/serverconfig.txt
CMD mono TerrariaServer.exe -config serverconfig.txt