#!/bin/sh

cd $(dirname $0)
set -eu

hugo
find public -name ".DS_Store" | xargs rm
# tar cz public | ssh colinmarc.com "sudo tar xvz --no-same-owner --strip-components=1 -C /var/www/worldtrip"
(cd public && rsync -avP --rsync-path="sudo rsync" . colinmarc.com:/var/www/worldtrip)
