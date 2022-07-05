CONST cache TO ARR ZERO SEP ONE END
FN fibonacci num DO
  IF cache OF length GT num DO
    RETURN cache OF at CALL num END
  END
  RETURN fibonacci CALL num SUB ONE END ADD fibonacci CALL sum SUB TWO END
END
