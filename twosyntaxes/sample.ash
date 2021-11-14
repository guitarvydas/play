object dispatcher
  function dispatch (self : dispatcher top : asc-container)
    with top
      while ?some-asc-ready
	@transfer-sender-outputs-to-receivers
	with asc = @find-ready-asc
	  let message = @pull-message-from-fifo
	    @invoke-once-with-message (message)
	  end let
	end with
      end while
    end with
  end function
end object