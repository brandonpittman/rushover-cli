require 'spec_helper'

describe Rushover::Cli do

  let(:rc_file) {Pathname.new("#{ENV['HOME']}/.rushrc")}
  let(:rush) {Rushover::Cli::Rush.new}

  it 'has a version number' do
    expect(Rushover::Cli::VERSION).not_to be nil
  end

  context ".rushrc file exists" do
    it "can read a rc file" do
      if rc_file.exist?
        expect(rush.get_key(:user)).to be_truthy
        expect(rush.get_key(:rush)).to be_truthy
      end
    end
  end


end
