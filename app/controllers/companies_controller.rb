class CompaniesController < ApplicationController
  layout "home"

  def new
    @company = Company.new
    @user = User.new
    @cities = ["Ambarès-et-Lagrave", "Ambès", "Artigues-près-Bordeaux", "Bassens",
                "Bègles", "Blanquefort", "Bordeaux", "Bouliac", "Bruges", "Carbon-Blanc",
                "Cenon", "Eysines", "Floirac", "Gradignan", "Le Bouscat", "Le Haillan", "Le Taillan-Médoc",
                "Lormont", "Martignas-sur-Jalle", "Mérignac", "Parempuyre", "Pessac", "Saint-Aubin-de-Médoc",
                "Saint-Louis-de-Montferrand", "Saint-Médard-en-Jalles", "Saint-Vincent-de-Paul", "Talence"]
  end

  def create
    @company = Company.new(company_params)
    @project = Project.find_by(name: "Bordeaux Métropole")
    @company.project = @project
    @user = User.new(user_params)
    if @company.save
      if @user.save
        @referent = Referent.new(company: @company, user: @user)
        @referent.save
        redirect_to root_path
      else
        @company.destroy
        render :new
      end
    else
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :town)
  end

  def user_params
    params.require(:company)["user"].permit(:civility, :first_name, :last_name, :role, :telephone, :email, :password, :newsletter_ekg, :newsletter_dzd)
  end
end