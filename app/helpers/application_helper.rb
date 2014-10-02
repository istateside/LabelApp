module ApplicationHelper
  def auth_token
    <<-HTML.html_safe
    <input
      name="authenticity_token"
      type="hidden"
      value="#{form_authenticity_token}">
    HTML
  end

  def ugly_lyrics(lyrics)
    new_lyrics = lyrics.split("\n")
    new_lyrics.map! do |line|
     "&#9835; #{h(line)}"
    end
    return <<-HTML.html_safe
    #{new_lyrics.join("<br>")}
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
