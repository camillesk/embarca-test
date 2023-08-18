# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cities/new_search', type: :view do
  before(:each) do
    @state = assign(:state, State.create!(name: 'State name', population: 23))
    assign(:city, City.new(
                    name: 'MyString',
                    population: 1,
                    state: @state
                  ))
  end

  it 'renders new search city form' do
    render

    assert_select 'form[action=?][method=?]', search_cities_path, 'post' do
      assert_select 'input[name=?]', 'search_cities[name]'

      assert_select 'input[name=?]', 'search_cities[state_name]'
    end
  end
end
