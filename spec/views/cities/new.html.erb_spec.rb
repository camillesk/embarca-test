# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cities/new', type: :view do
  before(:each) do
    @state = assign(:state, State.create!(name: 'State name', population: 23))
    assign(:city, City.new(
                    name: 'MyString',
                    population: 1,
                    state: @state
                  ))
  end

  it 'renders new city form' do
    render

    assert_select 'form[action=?][method=?]', cities_path, 'post' do
      assert_select 'input[name=?]', 'city[name]'

      assert_select 'input[name=?]', 'city[population]'

      assert_select 'select[name=?]', 'city[state_id]'
    end
  end
end
