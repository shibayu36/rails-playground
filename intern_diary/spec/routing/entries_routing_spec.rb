# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EntriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/users/shibayu36/entries').to route_to(
        controller: 'entries',
        action: 'index',
        username: 'shibayu36'
      )
    end

    it 'routes to #new' do
      expect(get: '/users/shibayu36/entries/new').to route_to(
        controller: 'entries',
        action: 'new',
        username: 'shibayu36'
      )
    end

    it 'routes to #show' do
      expect(get: '/users/shibayu36/entries/12').to route_to(
        controller: 'entries',
        action: 'show',
        username: 'shibayu36',
        id: '12'
      )
    end

    xit 'routes to #edit' do
      expect(get: '/entries/1/edit').to route_to('entries#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/users/shibayu36/entries').to route_to(
        controller: 'entries',
        action: 'create',
        username: 'shibayu36'
      )
    end

    xit 'routes to #update via PUT' do
      expect(put: '/entries/1').to route_to('entries#update', id: '1')
    end

    xit 'routes to #update via PATCH' do
      expect(patch: '/entries/1').to route_to('entries#update', id: '1')
    end

    xit 'routes to #destroy' do
      expect(delete: '/entries/1').to route_to('entries#destroy', id: '1')
    end
  end
end
