require 'spec_helper'

describe Nextia::Utils::AWSUploader do

  describe ".upload" do   
    uploader = Nextia::Utils::AWSUploader.new(
        '',
        '',
        '',
        '')
    
    context "verify 'large file'" do
      it "succesful test" do
        file = File.open("spec/test_file.jpg")
        url = uploader.upload(file, "first_test/test_file.jpg")
        large_file_url = url.rpartition('/').first +  '/' + File.basename(file, ".*") + '_large' + File.extname(file)
        image = MiniMagick::Image.open(large_file_url)
        expect(image.height).to eql(1000)
        expect(image.width).to eql(1000)
      end
    end

    context "verify 'medium file'" do
      it "succesful test" do
        file = File.open("spec/test_file.jpg")
        url = uploader.upload(file, "second_test/test_file.jpg")
        medium_file_url = url.rpartition('/').first +  '/' + File.basename(file, ".*") + '_medium' + File.extname(file)
        image = MiniMagick::Image.open(medium_file_url)
        expect(image.height).to eql(600)
        expect(image.width).to eql(600)
      end
    end

    context "verify 'small file'" do
      it "succesful test" do
        file = File.open("spec/test_file.jpg")
        url = uploader.upload(file, "third_test/test_file.jpg")
        small_file_url = url.rpartition('/').first +  '/' + File.basename(file, ".*") + '_small' + File.extname(file)
        image = MiniMagick::Image.open(small_file_url)
        expect(image.height).to eql(200)
        expect(image.width).to eql(200)
      end
    end

    
  end
end