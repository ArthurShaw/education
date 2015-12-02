module SectionsHelper

  def has_events(sections)
    unless sections
      return false
    end
    if sections.is_a? Section
      return sections.events && sections.events.size > 0
    end
    sections.each do |section|
      if section.events && section.events.size > 0
        return true
      end
    end
    false
  end

end
