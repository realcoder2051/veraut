User.create(email: "aamir@devbox.co",username:"Aamir",password:"devbox123")
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

notify 'Creating user seeds'
users = [{ name: 'user1', email: 'user1@devbox.co' }]
30.times do
  users << { name: FFaker::Name.name, email: FFaker::Internet.email }
end
users.each { |user| create_user_seed(user) }

puts; puts 'rake db:seed summary:'
@messages.each { |m| puts m }
puts
