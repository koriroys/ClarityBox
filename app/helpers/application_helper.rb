module ApplicationHelper

  # def avatar_url(user)
  #   gravatar_id = Digest::MD5::hexdigest(user.email).downcase
  #   "http://gravatar.com/avatar/#{gravatar_id}.png"
  # end


  def user_company?(company_id)
    current_user.company_id == company_id
  end

  def calculate_percentage(responses, total_responses)
    ratio = responses.to_f / total_responses.to_f
    percent = ratio * 100
    rounded = percent.round
  end

end
