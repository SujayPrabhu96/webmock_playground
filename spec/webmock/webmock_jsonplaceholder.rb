class WebmockJsonplaceholder
  SPEC_FIXTURES_PATH = 'spec/fixtures'.freeze
  TODOS_SUCCESS_RESPONSE = File.read("#{SPEC_FIXTURES_PATH}/todos_success_response.json").freeze

  def self.call(env)
    new.call(env)
  end

  def call(env)
    action = env['REQUEST_METHOD']
    path = env['PATH_INFO']
    # similarly query params can be accessed using env['QUERY_STRING']

    if action == 'GET' && path == '/todos'
      case path
      when '/todos'
        [ 200, {}, [ TODOS_SUCCESS_RESPONSE ] ]
      else
        [ 404, {}, [ "NOT FOUND" ] ]
      end
    end
  end
end
