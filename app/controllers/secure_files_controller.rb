class SecureFilesController < InheritedResources::Base

  def index
    @secure_files = SecureFile.all
  end

end
