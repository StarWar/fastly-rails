require_relative '../../test_helper'

describe FastlyRails::ActiveRecord::SurrogateKey do
  let(:api_key)    { 'test' }
  let(:user)       { nil }
  let(:password)   { nil }
  let(:max_age)    { 100_000 }
  let(:service_id) { 'someserviceid' }
  let(:client)     { FastlyRails.client }

  before do
    FastlyRails.configure do |c|
      c.api_key    = api_key
      c.user       = user
      c.password   = password
      c.max_age    = max_age
      c.service_id = service_id
    end
  end

  it 'performs a soft_purge' do
    assert_equal({ 'status' => 'ok' }, Book.new(id: 1).soft_purge)
  end

  it 'performs a soft_purge_all' do
    assert_equal({ 'status' => 'ok' }, Book.new(id: 1).soft_purge_all)
  end
end
