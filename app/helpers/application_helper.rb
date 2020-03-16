module ApplicationHelper
  def admin
    current_user.username == "admin"
  end

  def admin_email
    current_user.email == "ku7%4ffth%43@oPmn"
  end

  def current_user_offers
    Company.find_by(user_id: current_user.id).offers
  end
  
end
