#!/bin/bash

if [[ $@ -ne 2 ]];
then 
  echo "Wrong parametes number..."
  echo "  Coorect usage: getxs <xs_package_name> <xs_file_name>"
  exit -1
fi

xsbaseurl="http://192.168.142.102:8000/" 
xsjs_user="<xsuser>"                                          
xsjs_password="<xspassword>"
authHeader="Authorization:Basic base64(<xsuser>:<xspassord>)"       
xspackage=$1
xsfile=$2


if [[ -z $xsimportpath ]]; then
  xsimportpath="/mnt/hgfs/SCRATCH/"
fi

xsgetfilesuffix="sap/hana/xs/dt/base/file/"

mkdir -p ./xs/${xspackage}

curl -o ./xs/${xspackage}/${xsfile} --location "${xsbaseurl}${xsgetfilesuffix}${xspackage}/${xsfile}" \
     --header "$authHeader" \
     --header "Cookie:$cookies_value"

dos2unix ./xs/${xspackage}/${xsfile}