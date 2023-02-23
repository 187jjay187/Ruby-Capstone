require_relative 'creator_json_file'

def exit_app(app)
  puts 'We are thrilled that you used our app!'
  create_dir
  app.save_files
  exit
end
