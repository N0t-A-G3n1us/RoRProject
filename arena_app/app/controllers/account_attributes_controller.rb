class AccountAttributesController < ApplicationController
    #before_action :get_gamer

    def new
    end

    def index
    end

    def edit
    end

    def update
        @gamer = Gamer.find_by(email: params[:email].downcase)
        if @gamer
          @gamer.update_attribute(:conssole,params[:account_attributes][:conssole])
          @gamer.update_attribute(:nickname,params[:account_attributes][:nickname])
          @gamer.update_attribute(:nation,params[:account_attributes][:nation])
          @gamer.update_attribute(:gammes,params[:account_attributes][:gammes])
          @gamer.update_attribute(:description,params[:account_attributes][:description])
          @gamer.update_attribute(:updated,true)

          flash[:info] = "attributes updated"
          redirect_to @gamer

        else
          flash.now[:danger] = "Email address not found"
          render 'edit'
        end

    end



    def create
        @gamer = Gamer.find_by(email: params[:email].downcase)
        if @gamer
          @gamer.update_attribute(:conssole,params[:account_attributes][:conssole])
          @gamer.update_attribute(:nickname,params[:account_attributes][:nickname])
          @gamer.update_attribute(:nation,params[:account_attributes][:nation])
          @gamer.update_attribute(:gammes,params[:account_attributes][:gammes])
          @gamer.update_attribute(:description,params[:account_attributes][:description])
          @gamer.update_attribute(:updated,true)
          flash[:info] = "attributes updated"
          redirect_to @gamer

        else
          flash.now[:danger] = "Email address not found"
          render 'new'
        end
    end

    private


    def gamer_params
      params.require(:gamer).permit(:email,:nickname , :description, :games , :console)
    end

    def get_gamer
      @gamer = Gamer.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_gamer
      unless (@gamer && @gamer.activated? &&
              @gamer.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

end
