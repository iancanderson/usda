Dir[File.dirname(__FILE__) + "/../lib/usda/*.rb"].each {|file| require file }

SPEC_SUPPORT_PATH = File.join(File.dirname(__FILE__), "support")
