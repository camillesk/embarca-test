# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cities/index', type: :view do
  before(:each) do
    assign(:cities, [
             City.create!(
               name: 'Name',
               population: 2,
               state: nil
             ),
             City.create!(
               name: 'Name',
               population: 2,
               state: nil
             )
           ])
  end

  it 'renders a list of cities' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
