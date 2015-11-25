module ApplicationHelper

  def request_controller
    params[:controller]
  end

  def admin_controller?
    request_controller.start_with? 'admin'
  end

  def translate_field(object, field)
    if I18n.locale == :en && object.respond_to?((getter = field.to_s + '_en'))
      object.method(getter).call
    else
      object.method(field).call
    end
  end

  def section_to_days(section)
    result = {}
    section.events.each do |event|
      result[event.date] ||= []
      result[event.date] << event
    end
    result = result.sort_by {|day, events| day}
    result.each do |day, events|
      events.sort! {|l, r| l.from <=> r.from}
    end
    result
  end

end
