# AWS UPLOADER

AWS UPLOADER is a file upload library written by [Gerardo Mathus](https://github.com/gemathus) for Ruby on Rails which features file upload to a S3 bucket without using Active Storage.

## Installing Gem
```
gem "aws_uploader"
```

## Usage
Add to your model a string attribute, in this we are going to save the file url.
You will need your aws access key ID, secret access key, the name of your bucket and region.
We recomend that you save this values as environment variables.

### Uploader Declaration
```
uploader = Nextia::Utils::AWSUploader.new(
        ENV['AWS_ACCESS_KEY_ID'],
        ENV['AWS_SECRET_ACCESS_KEY'],
        ENV['AWS_S3_BUCKET'],
        ENV['AWS_REGION'])
```
### File Upload
```
url = uploader.upload(YOUR_FILE,YOUR_DESIRED_PATH)
```

### Implementation example
```
if params[:file].nil?
    uploader = Nextia::Utils::AWSUploader.new(
        ENV['AWS_ACCESS_KEY_ID'],
        ENV['AWS_SECRET_ACCESS_KEY'],
        ENV['AWS_S3_BUCKET'],
        ENV['AWS_REGION']
    )
    url = uploader.upload(
        params[:file],
        "users/#{user.name}.jpg")
    user.update(profile_picture: url)
end
```

## TODO
- Delete files from bucket.

### TEST THUMB VERSIONS
RUN 'BUNDLE INSTALL' FOR INSTALL TEST DEPENDENCIES
ADD USER CREDENTIALS INTO SPEC/AWS_UPLOADER_SPEC.RB
AFTER THIS RUN 'RSPEC' IN COMMAND LINE