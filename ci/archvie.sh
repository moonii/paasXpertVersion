#!/bin/sh

#set -e

echo "archive.sh called"
echo "ls version2-git"
ls version2-git

#NEW_VERSION=$(cat version2-git/version)
echo "NEW_VERSION=$NEW_VERSION="

if [$ADMIN_USER]; then
	dir = "PaaSXpertPortal"
        dir_sub="paasxpert.portal.web"

else
	if [ "$ADMIN_USESR" != "admin" ]; then
      		dir = "PaaSXpertPortal"
                dir_sub = "paasxpert.portal.web"

    	else
      		dir = "PaaSXpertAdmin"
                dir_sub"paasxpert.admin.web"

    	fi
fi
echo "dir=$dir/$dir_sub"
cd  ci3-git/$(dir)/$(dir_sub)
echo "pwd=$pwd"

zip archive-out/$(dir_sub)-v.$(NEW_VERSION).zip ./* -r 
