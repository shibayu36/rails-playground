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

    it 'routes to #edit' do
      expect(get: '/users/shibayu36/entries/1/edit').to route_to(
        controller: 'entries',
        action: 'edit',
        username: 'shibayu36',
        id: '1'
      )
    end

    it 'routes to #create' do
      expect(post: '/users/shibayu36/entries').to route_to(
        controller: 'entries',
        action: 'create',
        username: 'shibayu36'
      )
    end

    it 'routes to #update via PUT' do
      expect(put: '/users/shibayu36/entries/1').to route_to(
        controller: 'entries',
        action: 'update',
        username: 'shibayu36',
        id: '1'
      )
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/users/shibayu36/entries/1').to route_to(
        controller: 'entries',
        action: 'update',
        username: 'shibayu36',
        id: '1'
      )
    end

    it 'routes to #destroy' do
      expect(delete: '/users/shibayu36/entries/1').to route_to(
        controller: 'entries',
        action: 'destroy',
        username: 'shibayu36',
        id: '1'
      )
    end
  end
end
