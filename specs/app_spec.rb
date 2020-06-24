require_relative 'spec_helper.rb'

# @resource App1
# App1 document describes the API for creating, reading, and deleting account ownerships.
describe App do
  #
  # Returns a list of ownerships associated with the account.
  #
  # Status can be -1(Deleted), 0(Inactive), 1(Active), 2(Expired) and 3(Cancelled).
  #
  # @path [GET] /a/b
  #
  # @parameter offset   [integer]               Used for pagination of response data (default: 25 items per response). Specifies the offset of the next block of data to receive.
  # @parameter status   [array<string>]         Filter by status. (e.g. status[]=1&status[]=2&status[]=3).
  # @parameter sort_order [enum<id,begin_at,end_at,created_at>]  Orders response by fields. (e.g. sort_order=created_at).
  # @parameter sort_descending    [boolean]     Reverse order of sort_order sorting, make it descending.
  # @parameter begin_at_greater   [date]        Filters response to include only items with begin_at >= specified timestamp (e.g. begin_at_greater=2012-02-15T02:06:56Z).
  # @parameter begin_at_less      [date]        Filters response to include only items with begin_at <= specified timestamp (e.g. begin_at_less=2012-02-15T02:06:56Z).
  # @parameter end_at_greater     [date]        Filters response to include only items with end_at >= specified timestamp (e.g. end_at_greater=2012-02-15T02:06:56Z).
  # @parameter end_at_less        [date]        Filters response to include only items with end_at <= specified timestamp (e.g. end_at_less=2012-02-15T02:06:56Z).
  it "should allow GET /a/b" do
    get '/a/b'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('GET /a/b path')
  end
  #
  # a/b/ Returns a list of ownerships associated with the account.
  #
  # Status can be -1(Deleted), 0(Inactive), 1(Active), 2(Expired) and 3(Cancelled).
  #
  # @path [POST] /a/b
  it "should allow POST /a/b" do
    post '/a/b'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('POST /a/b path')
  end

  it "should allow POST /b/c" do
    post '/b/c'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('POST /b/c path')
  end

  it "should get error" do
    get '/not/found'
    expect(last_response).not_to be_ok
  end
end
