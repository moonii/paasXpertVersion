#!/bin/sh

#set -e

echo "archive.sh called"
echo "ls -o ci-git"
ls ci-git

echo "NEW_VERSION=$NEW_VERSION="

NEW_VERSION=$(cat ci-git/version)

echo "NEW_VERSION=$NEW_VERSION="
echo "ADMIN_USER=$ADMIN_USER="

if [ $ADMIN_USER ]; then
	dir="PaaSXpertPortal"
        dir_sub="paasxpert.portal.web"

else
	if [ "$ADMIN_USER" != "admin" ]; then
      		dir="PaaSXpertPortal"
                dir_sub="paasxpert.portal.web"

    	else
      		dir="PaaSXpertAdmin"
                dir_sub="paasxpert.admin.web"

    	fi
fi
echo "dir/dir_sub=$dir/$dir_sub="

echo "ls design-git =========================="
ls design-git
echo "========================================"

cd  design-git/$dir/$dir_sub
echo "pwd=$pwd="


file_name=$dir_sub-v.$NEW_VERSION.zip 
zip $file_name ./* -r 

echo "ls -o $file_name========================"
ls -o $file_name

cp $file_name ../../../archive-out

echo "ls ../../../archive-out==================="
ls -o ../../../archive-out
echo "======================================="
