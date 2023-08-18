# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cities/index', type: :view do
  before(:each) do
    @state = assign(:state, State.create!(name: 'State name', population: 23))
    assign(:cities, [
             City.create!(
               name: 'Name',
               population: 2,
               state: @state
             ),
             City.create!(
               name: 'Name',
               population: 2,
               state: @state
             )
           ])
  end

  it 'renders a list of cities' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: @state.name.to_s, count: 2
  end
end
