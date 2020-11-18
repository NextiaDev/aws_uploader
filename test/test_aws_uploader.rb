require 'minitest/autorun'
require 'aws_uploader'

class TestAwsUploader < Minitest::Test
  def test_hi
    uploader = Nextia::Utils::AWSUploader.new(
        'AKIA55QJG25ZE55XWR4I',-
        '1k0bHWYzsqVxLfKh3KalcszzbG0VKWmfPKNXVmFZ',
        'aws-uploader-test-bucket',
        'us-east-1')
    file = File.open("test/test_file.jpg")
    url = uploader.upload(
          file,
          "testing/test_file.jpg")

    puts uploader.inspect
  end
end