
1.times do
  User.create(email: "aamir@devbox.co",username:"Aamir",password:"devbox123") 
end
@messages = []

#
# Helper methods
# --------------

def notify(str)
  @messages << ' '
  @messages << "===> #{str}..."
end

def add_message(str)
  @messages << "  #{str}"
end

def create_scheduled_job_seed(params)
  if ScheduledJob.where(job_class: params[:job_class]).exists?
    add_message "#{params[:job_class]} already exists."
  else
    ScheduledJob.create!(params)
    add_message "Created scheduled job for #{params[:job_class]}."
  end
end

def create_user_seed(params)
  if User.where(email: params[:email]).exists?
    add_message "#{params[:name]} already exists."
  else
    pw = 'devbox123'
    User.create!(params.merge({ password: pw, password_confirmation: pw }))
    add_message "Created user #{params[:name]}. Password: #{pw}"
  end
end

# -------------------
# End: Helper methods
#

notify 'Creating schedule job seeds'
create_scheduled_job_seed(job_class: 'StarterKitWorker', frequency_quantity: 1, frequency_period: 'minutes')

notify 'Creating user seeds'
users = [{ name: 'user1', email: 'user1@devbox.co' }]
30.times do
  users << { name: FFaker::Name.name, email: FFaker::Internet.email }
end
users.each { |user| create_user_seed(user) }

puts; puts 'rake db:seed summary:'
@messages.each { |m| puts m }
puts
