module ApplicationHelper


  def session_link
    if logged_in?
      link_to "Log out", logout_path, method: :delete,  class: "nav-link"
    else
      link_to "Log in", login_path,  class: "nav-link"
    end
  end

end
