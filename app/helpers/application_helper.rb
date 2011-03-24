module ApplicationHelper

  # def setup_event(event)
  #     returning(event) do |e|
  #       e.address.build if e.address.empty?
  #     end
  # end
  
  def event_time(date)
    date.strftime("%B %d, %I:%M %p")
  end
  
  def parent_layout(layout)
    @_content_for[:layout] = self.output_buffer
    self.output_buffer = render(:file => "layouts/#{layout}")
  end
  
  def site_name
    SITE['site_name']
  end
  
end
