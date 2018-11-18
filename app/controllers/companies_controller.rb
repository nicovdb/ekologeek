class CompaniesController < ApplicationController
  before_action :set_company, only: [ :edit, :update]
  layout Proc.new{ ['new'].include?(action_name) ? 'home' : 'connected' }

  def new
    @company = Company.new
    @user = User.new
  end

  def create
    @company = Company.new(company_params)
    @project = Project.find_by(name: "Bordeaux Métropole")
    @company.project = @project
    @user = User.new(user_params)
    if @company.save
      @user.company_id = @company.id
      if @user.save
        @referent = Referent.new(company: @company, user: @user)
        @referent.save
        @form = Form.new(company: @company)
        @form.save

        CompaniesMailer.creation_confirmation(@referent).deliver_now
        redirect_to user_path(@user)
      else
        @company.destroy
        render :new
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user = current_user
    @company.update(company_params)
    redirect_to user_path(@user)
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :town, :usage_acceptance)
  end

  def user_params
    params.require(:company)["user"].permit(:civility, :first_name, :last_name, :role, :telephone, :email, :password, :newsletter_ekg, :newsletter_dzd)
  end
end
