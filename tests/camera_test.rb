require 'minitest/autorun'

require_relative '../lib/olympia/camera'

class TestCamera < Minitest::Test

    def setup
        @camera = Olympia::Camera.new
    end

    def test_hello
        @text = 'hello, world'
        assert_equal('hello, world', @text)
    end

    def test_parse_list
        # body mark test
        body = 'WRONG_VER_100'
        assert_equal('Olympia: NO BODY MARK', @camera.parse_list(body))
        # section num test
        body = '''VER_100
/DCIM,100OLYMP,0,16,18317,22048
/DCIM,101OLYMP,0,16,18317,22048
'''
        @camera.parse_list(body)
    end
end
