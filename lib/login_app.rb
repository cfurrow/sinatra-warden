class LoginManager < Sinatra::Base
  #use_in_file_templates!
  set :inline_templates, true

  get "/" do
    # render :welcome
    username = "you're not logged in"
    authenticated = env['warden'].authenticated?
    if authenticated
      username = env['warden'].user.email
    end
    haml :welcome,:locals=>{:user=>username,:authenticated=>authenticated}
  end

  post '/unauthenticated/?' do
    status 401
    haml :login
  end

  get '/login/?' do
    haml :login
  end

  post '/login/?' do
    env['warden'].authenticate!
    redirect "/"
  end

  get '/logout/?' do
    env['warden'].logout
    redirect '/'
  end
end


__END__
@@layout
%h1 Title
= yield

@@welcome
="Hi #{user}."
%br
- if authenticated
  %a{:href=>"/logout"}Logout
- else
  %a{:href=>"/login"}Login


@@login
please login
%form{:method=>"post",:action=>"/login"}
  %label username
  %br
  %input{:name=>"email",:type=>"text"}
  %br

  %label password
  %br
  %input{:name=>"password",:type=>"password"}

  %input{:type=>"submit",:value=>"submit"}
