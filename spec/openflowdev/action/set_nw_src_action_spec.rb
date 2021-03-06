require 'spec_helper'
require 'openflowdev/actions/set_nw_src_action'

RSpec.describe SetNwDstAction do
  describe 'argument validation' do
    it 'requires an IP Address for instantiation' do
      expect { SetNwSrcAction.new(order: 0) }.to raise_error(ArgumentError,
        "IP Address (ip_addr) required")
    end
  end
end