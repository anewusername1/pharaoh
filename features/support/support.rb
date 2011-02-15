User.delete_all
Dir[File.expand_path("spec/factories/**/*.rb", Rails.root)].each {|f| require f}
