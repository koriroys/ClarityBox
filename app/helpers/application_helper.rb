module ApplicationHelper

  def user_company?(company_id)
    current_user.company_id == company_id
  end

end
