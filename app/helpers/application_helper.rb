module ApplicationHelper
  def format_date date
    date.strftime "%d-%b-%Y" unless date.nil?
  end
end
