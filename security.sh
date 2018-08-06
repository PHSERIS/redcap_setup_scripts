#!/bin/bash

cd /var/www/html/redcap
chown -R root:apache .
find . -type d -exec chmod u=rwx,g=rx,o= '{}' \;
find . -type f -exec chmod u=rw,g=r,o= '{}' \;
chcon -R -u system_u -t httpd_sys_content_t /var/www/html/redcap;

# eDocs
cd /var/www/html/redcap/edocs
find . -type d -name files -exec chmod ug=rwx,o= '{}' \;
for d in ./*/files
do
   find $d -type d -exec chmod ug=rwx,o= '{}' \;
   find $d -type f -exec chmod ug=rw,o= '{}' \;
done
chcon -R -u system_u -t httpd_sys_rw_content_t /var/www/html/redcap/edocs;

# temp
cd /var/www/html/redcap/temp
find . -type d -name files -exec chmod ug=rwx,o= '{}' \;
for d in ./*/files
do
   find $d -type d -exec chmod ug=rwx,o= '{}' \;
   find $d -type f -exec chmod ug=rw,o= '{}' \;
done
chcon -R -u system_u -t httpd_sys_rw_content_t /var/www/html/redcap/temp;

# external modules
cd /var/www/html/redcap/modules
find . -type d -name files -exec chmod ug=rwx,o= '{}' \;
for d in ./*/files
do
   find $d -type d -exec chmod ug=rwx,o= '{}' \;
   find $d -type f -exec chmod ug=rw,o= '{}' \;
done
chcon -R -u system_u -t httpd_sys_rw_content_t /var/www/html/redcap/modules;
