module SectionsHelper

  def has_events(sections)
    unless sections
      return false
    end
    if sections.is_a? Section
      return sections.schedule_intervals && sections.schedule_intervals.size > 0
    end
    sections.each do |section|
      if section.schedule_intervals && section.schedule_intervals.size > 0
        return true
      end
    end
    false
  end

end
