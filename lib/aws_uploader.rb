require 'aws-sdk-s3'
module Nextia
    module Utils
        class AWSUploader
            def initialize(aws_access_key_id, aws_secret_access_key, bucket, region)
                @bucket = bucket
                @s3_resource = Aws::S3::Resource.new(
                    credentials: Aws::Credentials.new(
                        aws_access_key_id,
                        aws_secret_access_key
                    ),
                    region: region
                )
            end
            def upload(file, file_path)
                new_object = @s3_resource.bucket(@bucket).object(file_path)
                new_object.upload_file(file, acl:'public-read')                
                return new_object.public_url
            end
        end
    end
end