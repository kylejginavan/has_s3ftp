s3ftp_config = HasS3ftp::Command.get_api_key
driver S3FTP::Driver
driver_args s3ftp_config[:aws_key], s3ftp_config[:aws_secret], s3ftp_config[:aws_bucket]
daemonise true
name      "has_s3ftp"
pid_file  "/var/run/has_s3ftp.pid"