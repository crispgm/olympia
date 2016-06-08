require 'minitest/autorun'
require 'webmock/minitest'

require_relative '../lib/olympia/camera'

class TestCamera < Minitest::Test

  def setup
    @camera = Olympia::Camera.new
  end

  def test_parse_list
    # section num test
    body =  "VER_100"
    body << "\n/DCIM,100OLYMP,0,16,18317,22048"
    body << "\n/DCIM,101OLYMP,0,16,18317,22048"
    files_list = @camera.parse_list(body)
    assert_equal('/DCIM', files_list[0][0])
    assert_equal('101OLYMP', files_list[1][1])
    assert_equal('22048', files_list[0][5])
  end

  def test_parse_list_get_ver
    # body mark test
    body = 'WRONG_VER_100'
    assert_equal('Olympia: NO BODY MARK', @camera.parse_list(body))
  end

  def test_get_caminfo
    stub_request(:get, '192.168.0.10')
      .with(body: '/get_caminfo.cgi')
      .to_return(status: 200, body: '<?xml version="1.0" encoding="UTF-8"?><caminfo><model>E-M5 Mark II</model></caminfo>')

    assert_equal('E-M5 Mark II', @camera.get_caminfo)
  end
end
