require 'spec_helper'

describe Rushover::Cli do

  let(:rc_file) {Pathname.new("#{ENV['HOME']}/.rushrc")}
  let(:rush) {Rushover::Cli::Rush.new}

  it 'has a version number' do
    expect(Rushover::Cli::VERSION).not_to be nil
  end

  it "it can find a .rushrc file if it exists" do
    expect(rush.rc_file_exist?).to be_truthy if rush.rc_file.exist?
  end

  it "can initialize a .rushrc file it doesn't exist" do
    rush.create_rc_file unless rush.rc_file.exist?
    hash = {user: :user, token: :token}
    expect(rush.rc_file_exist?).to be_truthy if rush.rc_file.exist?
    fail
  end

end
