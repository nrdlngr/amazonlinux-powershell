FROM amazonlinux
RUN yum install -y https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-beta.1/powershell-6.0.0_beta.1-1.el7.centos.x86_64.rpm libuuid aws-cli
RUN powershell -command 'Install-Package -Name AWSPowerShell.NetCore -Source https://www.powershellgallery.com/api/v2/ -ProviderName NuGet -ExcludeVersion -Destination /usr/local/share/powershell/Modules -Force'
RUN mkdir -p /root/.config/powershell && echo 'Import-Module AWSPowerShell.NetCore' >> /root/.config/powershell/Microsoft.PowerShell_profile.ps1
COPY get-ami-by-name.sh /usr/local/bin/get-ami-by-name.sh
ENTRYPOINT /usr/local/bin/get-ami-by-name.sh
