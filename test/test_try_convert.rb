require 'minitest/unit'

$VERBOSE = true
require "#{File.dirname File.dirname(__FILE__)}/lib/try_convert"
class Test_try_convert < MiniTest::Unit::TestCase
	def test_try_convert_float
		good = [
			[ 3.13, 3.14 ], # Float
			[ 42, 42.0 ],   # Fixnum
			# TODO: Bignum?
			[ Rational(1,2), 0.5 ], # to_f
			[ "1.2", 1.2 ],
			[ "0x11", 17.0 ],
			[ "123e-2", 1.23 ],
			[ "0x1p1", 2.0 ],
		]
		bad = [
			"1x",
			nil,
			Object.new
		]
		good.each do |arg, exp|
			assert_equal( exp, Float.try_convert(arg) )
		end
		bad.each do |arg|
			assert_nil( Float.try_convert(arg) )
		end
	end
	def test_try_convert_integer
		good = [
			[ 1.0, 1 ], # Floats
			[ 1.9, 1 ],
			[ 1, 1 ], # Fixnum
			# TODO: Bignum?
			[ "42", 42 ], # Strings
			[ "0x11", 17 ],
			[ "0b11", 3 ],
			[ "011", 9 ],
			[ Rational(11,4), 2 ], # to_int
			[ Time.at(3600), 3600 ], # to_i
		]
		bad = [
			"1x",
			nil,
			Object.new
		]
		good.each do |arg, exp|
			assert_equal( exp, Integer.try_convert(arg) )
		end
		bad.each do |arg|
			assert_nil( Integer.try_convert(arg) )
		end
	end
	def test_try_convert_proc
		p = proc{}
		l = ->{}
		ins = :inspect.to_proc
		good = [
			[ p, p ],
			[ l, l ],
			[ :inspect, ins ],
		]
		bad = [
			nil,
			Object.new
		]
		good.each do |arg, exp|
			assert_equal( exp, Proc.try_convert(arg) )
		end
		bad.each do |arg|
			assert_nil( Proc.try_convert(arg) )
		end
	end
end

