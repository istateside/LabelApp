module ApplicationHelper
  def auth_token
    <<-HTML.html_safe
    <input
      name="authenticity_token"
      type="hidden"
      value="#{form_authenticity_token}">
    HTML
  end

  # def errors
#     errors = []
#
#     flash.now[:errors].each { |error| errors << error } if !!flash.now[:errors]
#     flash[:errors].each { |error| errors << error } if !!flash[:errors]
#
#     <<-HTML.html_safe
#     <ul>
#       #{errors.each do |error| }
#         <li>#{print error}
#       #{end}
#     </ul>
#     HTML
#   end

end
