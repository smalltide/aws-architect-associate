#!/bin/bash
yum update -y
aws s3 sync --delete s3://myCodeBucket /var/www/html
aws s3 sync --delete s3://myMediaBucket /var/www/html/wp-content/uploads 
