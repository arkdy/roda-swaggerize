require 'roda'

# @resource Account ownership
#
# This document describes the API for creating, reading, and deleting account ownerships.
#
class App < Roda
  plugin :hash_routes
  ##
  # Returns a list of ownerships associated with the account.
  #
  # Status can be -1(Deleted), 0(Inactive), 1(Active), 2(Expired) and 3(Cancelled).
  #
  # @path [GET] /default
  #
  # @parameter offset   [integer]               Used for pagination of response data (default: 25 items per response). Specifies the offset of the next block of data to receive.
  # @parameter status   [array<string>]         Filter by status. (e.g. status[]=1&status[]=2&status[]=3).
  # @parameter sort_order [enum<id,begin_at,end_at,created_at>]  Orders response by fields. (e.g. sort_order=created_at).
  hash_routes "" do
    #
    # @path [GET] /a
    on "a" do |r|
      r.hash_routes '/a'
    end

    on "b" do |r|
      r.hash_routes(:b)
    end
  end

  # Block argument is used, block is yielded DSL instance
  hash_routes "/a" do |hr|
    # is method is used for routing to the remaining path,
    # for similarity to standard Roda
    hr.is "b" do |r|
      r.get do
        response.write 'GET /a/b path'
      end
      r.post do
        response.write 'POST /a/b path'
      end
    end

    hr.is "c" do |r|
      response.write  '/a/c path'
    end
  end

  hash_routes :b do
    get "b" do |r|
      response.write 'GET /b/b path'
    end

    post "c" do |r|
      response.write 'POST /b/c path'
    end
  end

  route do |r|
    r.hash_branches
  end
end
