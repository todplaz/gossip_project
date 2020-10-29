class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:show, :new, :create, :edit, :update, :destroy]
  
  def index
    @gossip = Gossip.all
  end

  def show
    @gossip = params[:id]
    @gossip_id = Gossip.find(params[:id])
    @get_city_name = City.find(@gossip_id.user.city_id).name
  end
  
  def new
    @post = Gossip.new
  end

  def create

    @post = Gossip.new(title: params[:title], tag_id: params[:tag], content: params[:content])
    @post.user = User.find_by(id: session[:user_id])
    if @post.save
      puts "saved"
      redirect_to gossips_path, notice: "potin sauvegardé!"

    else
      puts "erreur"
      puts @post.errors.messages
      render "new"
    end

  end

  def edit
    if good_user? == true
      @gossip = params[:id]
      @gossip_id = Gossip.find(params[:id])
    end
  end

  def update
    if good_user? == true
      @gossip = Gossip.find(params[:id])
      post_params = params.require(:gossip).permit(:title, :content)
      if @gossip.update(post_params)
        redirect_to gossips_path
      else
        render 'new'
      end
    end
  end

  def destroy
    if good_user? == true
      @gossip = Gossip.find(params[:id])
      @gossip.destroy
      redirect_to gossips_path
    end
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
