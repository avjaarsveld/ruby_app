class DataCruncher

  def initialize(data)
    @data = data
  end

  def most_page_views
    @data.sort_by {|key, value| -value.count}.collect{|key, value| "#{key} #{value.count} #{basic_plurilized('visit', value.count)}"}
  end

  def most_unique_page_views
    @data.sort_by {|key, value| -value.uniq.count}.collect{|key, value| "#{key}\t#{value.uniq.count} #{basic_plurilized('unique view', value.uniq.count)}"}
  end

  private

  # Could have used `require 'active_support/core_ext/string'` `'visit'.pluralize(2)` instead of this
  def basic_plurilized(string, count)
    count > 1 ? string + 's' : string
  end

end