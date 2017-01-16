#!/bin/sh

#set -e

echo "archive.sh called"
echo "ls -o ci3-git"
ls ci3-git

echo "NEW_VERSION=$NEW_VERSION="

NEW_VERSION=$(cat ci3-git/version)

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

zip ../../archive-out/$dir_sub-v.$NEW_VERSION.zip ./* -r 

echo "ls ../../ archive-out==================="
ls ../../archive-out
echo "======================================="
