pkg upgrade -yq
pkg install -yq bash zsh virtualbox-ose-additions-nox11

pkg install -yq php70 php70-extensions php70-bcmath php70-bz2 php70-calendar php70-exif php70-fileinfo php70-filter php70-ftp php70-gd php70-gettext php70-hash php70-imap php70-intl php70-mbstring php70-mcrypt php70-mysqli php70-opcache php70-openssl php70-pcntl php70-readline php70-redis php70-session php70-simplexml php70-sockets php70-sqlite3 php70-tokenizer php70-xmlrpc php70-xmlwriter php70-xsl php70-zip php70-zlib

pkg install -yq colordiff curl gettext git gmake graphviz ImageMagick7-nox11 mariadb101-client mariadb101-server nginx ngrep node npm vim-lite subversion

sysrc nfs_server_enable="YES"
service nfsd restart
sysrc vboxguest_enable="YES"
sysrc vboxservice_enable="YES"
service vboxservice restart

sysrc php_fpm_enable="YES"
service php-fpm restart

sysrc nginx_enable="YES"
service nginx restart

#echo '<?php phpinfo(); ?>' > /usr/local/www/nginx/index.php
#chown www:www /usr/local/www/nginx/index.php