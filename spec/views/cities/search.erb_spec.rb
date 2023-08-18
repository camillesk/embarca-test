# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cities/search', type: :view do
  before(:each) do
    @state = assign(:state, State.create!(name: 'State name', population: 23))
    @cities = [assign(:city, City.create!(
                               name: 'Name',
                               population: 2,
                               state: @state
                             ))]
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/State name/)
  end
end
