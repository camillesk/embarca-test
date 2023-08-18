# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cities/edit', type: :view do
  before(:each) do
    @state = assign(:state, State.create!(name: 'State name', population: 23))
    @city = assign(:city, City.create!(
                            name: 'Name',
                            population: 2,
                            state: @state
                          ))
  end

  it 'renders the edit city form' do
    render

    assert_select 'form[action=?][method=?]', city_path(@city), 'post' do
      assert_select 'input[name=?]', 'city[name]'

      assert_select 'input[name=?]', 'city[population]'

      assert_select 'select[name=?]', 'city[state_id]'
    end
  end
end
