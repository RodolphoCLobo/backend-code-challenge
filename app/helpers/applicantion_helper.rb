module ApplicationHelper
  class << self
    def parse_values(params)
      if params['origin'].present? && params['destination'].present?
        params['origin'].downcase!
        params['destination'].downcase!
      end
      params
    end
  end
end
