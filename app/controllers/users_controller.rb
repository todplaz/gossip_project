class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], email: params[:email], age: params[:age], city_id: params[:city_id], password: params[:password])
    
    if @user.save
      puts "user saved"
      redirect_to gossips_path, notice: "Tu as créés ton profile de commère!"

    else
      puts "user erreur"
      puts @user.errors.messages
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @author_info = Gossip.find(params[:id]).user
    @user_city = @author_info.city.name
  end

end
