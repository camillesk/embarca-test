# frozen_string_literal: true

module ApplicationHelper
  def nav_item_active?(controller, action)
    params[:controller] == controller && params[:action] == action ? 'active' : nil
  end
end
