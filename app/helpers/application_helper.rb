# frozen_string_literal: true

module ApplicationHelper
  def is_nav_item_active?(controller)
    params[:controller] == controller ? 'active' : nil
  end
end
