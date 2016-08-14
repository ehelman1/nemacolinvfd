require "sinatra"
require "pony"

load "./local_env.rb" if File.exist?("./local_env.rb")

get '/' do

	erb :index 

end

get '/about' do

	erb :about 

end

get '/contact' do

	erb :contact 

end

get '/fleet' do

    erb :fleet
    
end

get '/gallery' do

    erb :gallery
    
end

get '/events' do

	erb :events

end

post '/contact-form' do
  name = params[:name]
  from = params[:email]
  to = "#{from}"                   
  comments = params[:message]
  subject= params[:subject]

    Pony.mail(
        :to => to, 
        :from => 'ehelman1@hotmail.org',
        :subject => "Nemacolin ", 
        :content_type => 'text/html', 
        :body => erb(:email2,:layout=>false),
        :via => :smtp, 
        :via_options => {
          :address              => 'smtp.gmail.com',
          :port                 => '587',
          :enable_starttls_auto => true,
           :user_name           => ENV['user_email'],
           :password            => ENV['user_email_pass'],
           :authentication       => :plain, 
           :domain               => "localhost" 
        }
      )

  erb :contact 
end 