#!/bin/sh
mkdir -p ./pbr
cd ./pbr

# AS4809 BGP
wget --no-check-certificate -c -O CN_v6.txt https://raw.githubusercontent.com/mayaxcn/china-ip-list/master/chnroute_v6.txt

{
echo "/ip firewall address-list"

for net in $(cat CN_v6.txt) ; do
  echo "add list=CN address=$net comment=AS4809"
done

} > ../CN_v6.rsc

cd ..
rm -rf ./pbr
