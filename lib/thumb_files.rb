require 'mini_magick'
module Nextia
    module Utils
        class ThumbFiles
            def initialize(file)
              @file = file
            end
            def large_file
                image = MiniMagick::Image.open(@file)
                image.resize "1000x1000"
                file_basename = File.basename(@file, ".*") + "_large" + File.extname(@file)
                image.write(file_basename)
                resized_file = File.open(file_basename)      
                File.delete(file_basename)          
                return resized_file
            end

            def medium_file
                image = MiniMagick::Image.open(@file)
                image.resize "600x1000"
                file_basename = File.basename(@file, ".*") + "_medium" + File.extname(@file)
                image.write(file_basename)
                resized_file = File.open(file_basename)      
                File.delete(file_basename)          
                return resized_file
            end

            def small_file
                image = MiniMagick::Image.open(@file)
                image.resize "200x200"
                file_basename = File.basename(@file, ".*") + "_small" + File.extname(@file)
                image.write(file_basename)
                resized_file = File.open(file_basename)      
                File.delete(file_basename)          
                return resized_file
            end
        end
    end
end