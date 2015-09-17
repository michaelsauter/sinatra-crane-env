require "sinatra"
require "sinatra/activerecord"

db = URI.parse(ENV["DB_PORT"])
ActiveRecord::Base.establish_connection(
  adapter:  "postgresql",
  host:     db.host,
  port:     db.port,
  username: ENV["POSTGRESQL_USER"],
  password: ENV["POSTGRESQL_PASS"],
  database: ENV["POSTGRESQL_DB"],
  encoding: "utf8"
)

class Post < ActiveRecord::Base
end

get "/" do
  @posts = Post.order("created_at DESC")
  redirect "/new" if @posts.empty?
  erb :index
end

get "/new" do
  erb :new
end

post "/new" do
  @post = Post.new(params[:post])
  if @post.save
    redirect "post/#{@post.id}"
  else
    erb :new
  end
end

get "/post/:id" do
  @post = Post.find_by_id(params[:id])
  erb :post
end