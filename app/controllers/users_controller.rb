class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_credentials
    
   #If a user is asmin they can see al the accounts
    def index
        if current_user.is_admin
            render json: User.all, status: :ok
        else
            render json: {error: "Not authorized"}, status: 401
        end
    end

    def show
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def create 
        user = User.create!(user_params)
        
        token = encode_token({user_id: user.id})
        render json: {user: UserSerializer.new(user), jwt: token}, status: :created
        
    end

    def update 
        user = find_user 
        user.update!(user_params)
    end 

    def destroy
        user = find_user 
        user.destroy
        head :no_content
    end 

    def name
        # user = User.find_by(id: decode_token[0]['user_id'])
        render json: current_user.to_json(only: [:first_name]), status: :ok
    end

    private
    def find_user
        user = User.find(params[:id])
    end

    def user_params 
        params.permit(:username, :password, :first_name, :last_name, :email, :is_admin)
    end

    def invalid_credentials(error)
        render json: {errors: error.record.errors.full_messages}, status: :unprocessable_entity
    end
end
