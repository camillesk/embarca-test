# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'states/index', type: :view do
  before(:each) do
    assign(:states, [
             State.create!(
               name: 'Name',
               population: 2
             ),
             State.create!(
               name: 'Name',
               population: 2
             )
           ])
  end

  it 'renders a list of states' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
  end
end
