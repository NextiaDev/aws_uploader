Gem::Specification.new do |s|
  s.name = %q{aws_uploader}
  s.version = "0.1.0"
  s.date = %q{2020-10-21}
  s.summary = %q{Easily upload files to AWS S3. No active storage. No hassle.}
  s.files = [
    "lib/aws_uploader.rb"
  ]
  s.authors = "Gerardo Mathus"
  s.require_paths = ["lib"]
  s.add_dependency 'aws-sdk-s3'
end