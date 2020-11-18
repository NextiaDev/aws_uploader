require 'aws-sdk-s3'
require 'thumb_files'
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
                file_direction =  File.dirname(file_path) + '/'
                file_thumbs = Nextia::Utils::ThumbFiles.new(file)
                new_object = @s3_resource.bucket(@bucket).object(file_path)
                new_object_large_file = @s3_resource.bucket(@bucket).object(file_direction + File.basename(file_thumbs.large_file))
                new_object_medium_file = @s3_resource.bucket(@bucket).object(file_direction + File.basename(file_thumbs.medium_file))
                new_object_small_file = @s3_resource.bucket(@bucket).object(file_direction + File.basename(file_thumbs.small_file))
                
                
                new_object.upload_file(file, acl:'public-read')
                new_object_large_file.upload_file(file_thumbs.large_file)
                new_object_medium_file.upload_file(file_thumbs.medium_file)
                new_object_small_file.upload_file(file_thumbs.small_file)    
                                          
                return new_object.public_url
            end
        end
    end
end