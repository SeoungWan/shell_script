#!/bin/bash

# 1. 웹 패키지 설치
yum -y install epel-release
yum -y install httpd mod_ssl boxes cowsay

# 2. 웹 설정
# 1) 디렉토리 생성 및 index.html 파일 생성
mkdir -p /www
cat << EOF > /www/index.html
<pre>
$(cowsay -f dragon-and-cow LINUX | boxes -d boy)
</pre>
EOF

# 2) httpd.conf 파일 편집
sed -i 's#^DocumentRoot "/var/www/html"#DocumentRoot "/www"#' /etc/httpd/conf/httpd.conf
sed -i 's#^<Directory "/var/www/html">#<Directory "/www">#' /etc/httpd/conf/httpd.conf

# 3. 서비스 기동
systemctl restart httpd
systemctl enable httpd




