class WelcomeController < ApplicationController
  def index
    if(params.has_key?(:id) &&
      params.has_key?(:random))
      @id = params['id']
      @random = params[:random]
  end
#   config_files = ['secrets.yml']

#     config_files.each do |file_name|
#       file_path = File.join(Rails.root, 'config', file_name)
#       config_keys = HashWithIndifferentAccess.new(YAML::load(IO.read(file_path)))[Rails.env]
#       config_keys.each do |k,v|
#         ENV[k.upcase] ||= v
#       end
#     end
end

  def sample
    @controller_message = "hello from controller"
  end
end
