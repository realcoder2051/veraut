class SecureFilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @csv_file = CsvFile.new
  end

  def upload_csv
    csv_file = params[:csv_file][:file]
    if csv_file.present?
      CSV.foreach(csv_file.path, headers: true, encoding: 'ISO-8859-1') do |row|
        CsvFile.create(data: row)
      end
      redirect_to secure_files_path, notice: "Data Uploaded Successfully."
    else
      redirect_to root_url, alert: "Data not Uploaded Successfully."
    end
  end

  def csv_data
    @csv_files = CsvFile.all
  end

end
