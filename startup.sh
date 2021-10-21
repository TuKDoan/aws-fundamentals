#!/bin/bash
#install apache
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd #start service on reboot

#mount ebs file system
sudo mkfs -t xfs /dev/sdh
cat <<EOF >> /etc/fstab
/dev/sdh   /var/www/html  xfs  defaults,nofail  0  2
EOF

mkdir /var/www/html
chmod 777 /var/www/html
sleep 300
mount /dev/sdh /var/www/html
mount -a

#create index.html
cat <<EOF >> /var/www/html/index.html
<h1>Hello AWS World</h1>
<a href="https://github.com/TuKDoan/aws-fundamentals">Source Code - Tu Doan</a>
EOF
