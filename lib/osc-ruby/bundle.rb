require File.join( File.dirname( __FILE__ ), "packet" )

module OSC
  class Bundle < Packet
    attr_accessor :timetag
    
    def initialize(timetag=nil, *args)
      @timetag = timetag
      @args = args
    end
    
    def encode()
      s = OSCString.new('#bundle').encode
      s << encode_timetag(@timetag)
      s << @args.collect do |x|
	      x2 = x.encode; [x2.size].pack('N') + x2
	    end.join
    end


    def to_a() @args.collect{|x| x.to_a} end


    
    private

    def encode_timetag(t)
      case t
        when NIL # immediately
	        t1 = 0
	        t2 = 1
        when Numeric
	        t1, fr = t.divmod(1)
	        t2 = (fr * (2**32)).to_i
        when Time
	        t1, fr = (t.to_f + 2208988800).divmod(1)
	        t2 = (fr * (2**32)).to_i
        else
	        raise ArgumentError, 'invalid time'
      end
      [t1, t2].pack('N2')
    end

  end
end