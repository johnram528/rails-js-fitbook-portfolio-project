module UsersHelper
  def health_status(user)
    if user.bmi > 18 && user.bmi <= 25
      "You're at at a healthy weight. Keep up the good work!"
    else 
      "Every workout counts. Keep up the good work!"
    end
  end

  
end
