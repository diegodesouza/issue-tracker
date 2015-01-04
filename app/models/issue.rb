class Issue < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :category

  def self.categories
    [
      'Bug',
      'Feature Request',
      'Customer Service'
    ]
  end

  validates_presence_of :severity
  
  def self.severities
    [
      'Low',
      'Moderate',
      'High'
    ]
  end
end
