require 'spec_helper'

describe Usda::Downloader do
  context "run" do
    before do
      # make sure the temp files are deleted
      `rm -rf #{Usda::Downloader::TEMP_DIR}`
    end
    after do
      # make sure the temp files are deleted
      `rm -rf #{Usda::Downloader::TEMP_DIR}`
    end
    it "should return an array of the unzipped files' absolute paths" do
      absolute_file_paths = Usda::Downloader.new.run
      absolute_file_paths.each do |path|
        File.exists?(path).should be_true
      end
    end
  end
end
