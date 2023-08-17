# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cities/edit', type: :view do
  before(:each) do
    @city = assign(:city, City.create!(
                            name: 'MyString',
                            population: 1,
                            state: nil
                          ))
  end

  it 'renders the edit city form' do
    render

    assert_select 'form[action=?][method=?]', city_path(@city), 'post' do
      assert_select 'input[name=?]', 'city[name]'

      assert_select 'input[name=?]', 'city[population]'

      assert_select 'input[name=?]', 'city[state_id]'
    end
  end
end
