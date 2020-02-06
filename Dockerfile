#FROM microsoft/aspnet:4.7.1-windowsservercore-1709
#ARG source
#WORKDIR /inetpub/wwwroot
#COPY ${source:-obj/Docker/publish} .

FROM microsoft/iis:latest


COPY DoDocker/bin/Release/Publish C:/inetpub/wwwroot

RUN powershell Remove-Item C:/inetpub/wwwroot/iisstart.htm -force
RUN powershell Remove-Item C:/inetpub/wwwroot/iisstart.PNG -force
RUN powershell Import-Module WebAdministration
RUN powershell New-WebAppPool -Name 'DockerPool'

#EXPOSE 8080





