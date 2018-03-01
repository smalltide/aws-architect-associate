#!/bin/bash
yum update -y
aws s3 sync --delete /var/www/html/wp-content/uploads s3://myMediaBucket 
aws s3 sync --delete /var/www/html s3://myCodeBucket 