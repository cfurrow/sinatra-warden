class LoginManager < Sinatra::Base
  #use_in_file_templates!
  set :inline_templates, true

  get "/" do
    # render :welcome
    "hi"
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

@@login
please login
= request.env
