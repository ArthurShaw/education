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

    section.schedule_intervals.each do |interval|
      result[interval.date] ||= []
      result[interval.date] << interval
    end
    result = result.sort_by { |day, intervals| day }
    result.each do |day, intervals|
      intervals.sort! { |l, r| l.from <=> r.from }
    end
    result
  end

end
