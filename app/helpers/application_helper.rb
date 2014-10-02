module ApplicationHelper
  def auth_token
    <<-HTML.html_safe
    <input
      name="authenticity_token"
      type="hidden"
      value="#{form_authenticity_token}">
    HTML
  end

  def errors
    if flash.now[:errors]
      flash.now[:errors].each { |error| error }
    elsif flash[:errors]
      flash[:errors].each { |error| error }
    end
  end

end
