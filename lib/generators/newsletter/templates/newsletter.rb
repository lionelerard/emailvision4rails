<% module_namespacing do -%>
class <%= class_name %>Newsletter < Emailvision4rails::AbstractNewsletter
<% actions.each do |action| -%>

  def <%= action %>
    @greeting = "Hi"

		newsletter(
			:message => {:name => "<%= action %>"},
			:campaign => {:send_date => Time.now+10.minutes, :mailinglist_id => 123}
		)	
  end
<% end -%>
end
<% end -%>