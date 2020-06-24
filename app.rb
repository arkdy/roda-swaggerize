require 'roda'

class App < Roda
  plugin :hash_routes

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
