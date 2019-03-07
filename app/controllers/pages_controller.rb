class PagesController < ApplicationController
  layout :pages_layout
  # skip_before_action :authenticate_user!, only: [:home]

  def dossier_de_mecenat
    send_file "#{Rails.root}/app/assets/documents/dossier_de_mecenat.pdf", type: "application/pdf", x_sendfile: true
  end

  def charte_graphique
    send_file "#{Rails.root}/app/assets/documents/charte_graphique.pdf", type: "application/pdf", x_sendfile: true
  end
  def communique_de_press
    send_file "#{Rails.root}/app/assets/documents/communique_de_press.pdf", type: "application/pdf", x_sendfile: true
  end

  def logo_RVB
    send_file "#{Rails.root}/app/assets/documents/logo_RVB.svg", type: "application/svg", x_sendfile: true
  end

  def cgv
    send_file "#{Rails.root}/app/assets/documents/cgv.pdf", type: "application/pdf", x_sendfile: true
  end

  def home
    @articles = Article.where(visibility: [:extern, :both], published: true).last(3)
  end

  private

  def pages_layout
    user_signed_in? ? "connected" : "home"
  end
end
